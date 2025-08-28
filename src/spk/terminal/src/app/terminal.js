// Namespace definition
Ext.ns("SynoCommunity.Terminal");

// Application definition
Ext.define("SynoCommunity.Terminal.AppInstance", {
    extend: "SYNO.SDS.AppInstance",
    appWindowName: "SynoCommunity.Terminal.AppWindow",
    constructor: function () {
        this.callParent(arguments);
    },
});

Ext.define("SynoCommunity.Terminal.AppWindow", {
    extend: "SYNO.SDS.AppWindow",
    layout: 'fit',
    width: '100%',
    height: '100%',
    title: 'Terminal',
    icon: "/webman/3rdparty/terminal/app/images/terminal.png",
    initComponent: function () {
        const path = window.location.pathname.replace(/[/]+$/, '');
        this.items = [
            {
                xtype: 'panel',
                border: false,
                html: '<iframe src="/terminal" style="width:100%;height:100%;border:none;"></iframe>'

            }
        ];
        this.callParent(arguments);
    },
    onOpen: function (a) {
        SynoCommunity.Terminal.AppWindow.superclass.onOpen.call(
            this,
            a
        );
    },
});
