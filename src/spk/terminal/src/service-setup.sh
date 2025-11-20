validate_preinst() {
	# use install_log to write to installer log file.
	install_log "validate_preinst ${SYNOPKG_PKG_STATUS}"
}

validate_preuninst() {
	# use install_log to write to installer log file.
	install_log "validate_preuninst ${SYNOPKG_PKG_STATUS}"
}

validate_preupgrade() {
	# use install_log to write to installer log file.
	install_log "validate_preupgrade ${SYNOPKG_PKG_STATUS}"
}

service_preinst() {
	# use echo to write to the installer log file.
	echo "service_preinst ${SYNOPKG_PKG_STATUS}"
}

service_postinst() {
	# use echo to write to the installer log file.
	echo "service_postinst ${SYNOPKG_PKG_STATUS}"
}

service_preuninst() {
	# use echo to write to the installer log file.
	echo "service_preuninst ${SYNOPKG_PKG_STATUS}"
}

service_postuninst() {
	# use echo to write to the installer log file.
	echo "service_postuninst ${SYNOPKG_PKG_STATUS}"
}

service_preupgrade() {
	# use echo to write to the installer log file.
	echo "service_preupgrade ${SYNOPKG_PKG_STATUS}"
}

service_postupgrade() {
	# use echo to write to the installer log file.
	echo "service_postupgrade ${SYNOPKG_PKG_STATUS}"
}

# REMARKS:
# installer variables are not available in the context of service start/stop
# The regular solution is to use configuration files for services

service_prestart() {
	# use echo to write to the service log file.
	echo "service_prestart: Before service start"

	# /etc/nginx/conf.d/alias.*.conf or /usr/syno/share/nginx/conf.d/dsm.*.conf
	ln -s ${SYNOPKG_PKGDEST}/etc/terminal.conf /etc/nginx/conf.d/alias.terminal.conf

	if nginx -t >/dev/null 2>&1; then
		systemctl reload nginx
	else
		rm -f /etc/nginx/conf.d/alias.terminal.conf
		echo "nginx configuration error"
	fi

	ARCH=$(uname -m)
	SHELL_CMD="${SYNOPKG_PKGDEST}/bin/tmux -u new -A -s terminal login"
	LD_LIBRARY_PATH="${SYNOPKG_PKGDEST}/bin:${SYNOPKG_PKGDEST}/lib:$LD_LIBRARY_PATH" \
	TERMINFO="${SYNOPKG_PKGDEST}/share/terminfo" \
	nohup ${SYNOPKG_PKGDEST}/bin/ttyd -p 17681 --base-path /terminal/ -W -t titleFixed=DSM -t allow-clipboard-read=true -t rendererType=canvas ${SHELL_CMD} >${LOG_FILE} 2>&1 &
	echo $! >"${PID_FILE}"
}

service_poststop() {
	# use echo to write to the service log file.
	echo "service_poststop: After service stop"

	rm -f /etc/nginx/conf.d/alias.terminal.conf
	systemctl reload nginx

	if [ -n "${PID_FILE}" -a -r "${PID_FILE}" ]; then
		for pid in $(cat "${PID_FILE}"); do
			if [ -z "${SVC_QUIET}" ]; then
				date >>${LOG_FILE}
				echo "Stopping ${DNAME} service : $(ps -p${pid} -o comm=) (${pid})" >>${LOG_FILE}
			fi
			kill -TERM ${pid} >>${LOG_FILE} 2>&1
			wait_for_status 1 ${SVC_WAIT_TIMEOUT:=20} ${pid} || kill -KILL ${pid} >>${LOG_FILE} 2>&1
		done
		if [ -f "${PID_FILE}" ]; then
			rm -f "${PID_FILE}" >/dev/null
		fi
	fi
}
