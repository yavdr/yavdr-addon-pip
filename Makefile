all:


install:
	@mkdir -p $(DESTDIR)/var/lib
	@cp -a vdr-pip $(DESTDIR)/var/lib
	@mkdir -p $(DESTDIR)/usr/share/yavdr
	#@cp -a templates $(DESTDIR)/usr/share/yavdr
	@cp -a images $(DESTDIR)/usr/share/yavdr
	#@mkdir -p $(DESTDIR)/etc/init
	#@cp vdr-pip.conf pipswap.conf vdr-pip-tft.conf vdr-pip-sp.conf vdr-pip-org.conf $(DESTDIR)/etc/init
	@mkdir -p $(DESTDIR)/usr/lib/systemd/user/
	@cp systemd/user/*.service $(DESTDIR)/usr/lib/systemd/user/
	@mkdir -p $(DESTDIR)/etc/dbus-1/system.d/
	@cp etc/dbus-1/system.d/de.tvdr.vdr1.conf $(DESTDIR)/etc/dbus-1/system.d/
	@mkdir -p $(DESTDIR)/etc/vdr-pip/scripts/
	@cp -r etc/vdr-pip/ $(DESTDIR)/etc/
	@mkdir -p $(DESTDIR)/usr/bin/
	@cp usr/bin/pipswap $(DESTDIR)/usr/bin/

clean:
