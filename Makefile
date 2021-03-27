.PHONY: all
all:
	@echo "Just run 'make install'"

.PHONY: install
install:
	@test ! -f  "$(DESTDIR)/etc/mkinitcpio-msg"\
	&& install -D -m0644 -v etc/mkinitcpio-msg "$(DESTDIR)/etc/mkinitcpio-msg" || :
	@install -D -m0644 -v install/msg "$(DESTDIR)/usr/lib/initcpio/install/msg"
	@install -D -m0644 -v hooks/msg   "$(DESTDIR)/usr/lib/initcpio/hooks/msg"

.PHONY: uninstall
uninstall:
	@test -f  "$(DESTDIR)/etc/mkinitcpio-msg"\
	&& rm -vi "$(DESTDIR)/etc/mkinitcpio-msg" || :
	@rm -vf   "$(DESTDIR)/usr/lib/initcpio/install/msg"
	@rm -vf   "$(DESTDIR)/usr/lib/initcpio/hooks/msg"
