PREFIX?=/usr/local
MANPREFIX?=${PREFIX}/share/man
STRIP?=strip

default: trim

trim: trim.c
	$(CC) -Wall -Os -o trim trim.c

clean:
	@echo cleaning
	@rm -f trim

install: trim
	@echo stripping executable
	@${STRIP} trim
	@echo installing executable to ${PREFIX}/bin
	@mkdir -p ${PREFIX}/bin
	@cp -f trim ${PREFIX}/bin/trim
	@chmod 755 ${PREFIX}/bin/trim

	@echo installing manual pages to ${MANPREFIX}/man1
	@mkdir -p ${MANPREFIX}/man1
	@cp -f trim.1 ${MANPREFIX}/man1/trim.1
	@chmod 644 ${MANPREFIX}/man1/trim.1

uninstall:
	@echo removing executable from ${PREFIX}/bin
	@rm ${PREFIX}/bin/trim
	@echo removing manual pages from ${MANPREFIX}/man1
	@rm ${MANPREFIX}/man1/trim.1

test:
	@sh test/tests.sh

.PHONY: clean install uninstall test
