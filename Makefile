all:


install:
	@mkdir -p $(DESTDIR)/var/lib
	@cp -a vdr-pip $(DESTDIR)/var/lib
	@mkdir -p $(DESTDIR)/usr/share/yavdr
	@cp -a templates $(DESTDIR)/usr/share/yavdr
	@cp -a images $(DESTDIR)/usr/share/yavdr
	@mkdir -p $(DESTDIR)/etc/init
	@cp vdr-pip.conf pipswap.conf $(DESTDIR)/etc/init
	@mkdir -p $(DESTDIR)/etc/dbus-1/system.d/
	@cp de.tvdr.vdr1.conf $(DESTDIR)/etc/dbus-1/system.d/

clean:
