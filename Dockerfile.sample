FROM &&OS&&:&&DIST&&

ADD php-compiler.sh /root/
ADD versions.sh /root/
RUN chmod +x /root/php-compiler.sh; \
    chmod +x /root/versions.sh; \
    /bin/bash /root/php-compiler.sh "&&PHPVL&&"; \
    /etc/init.d/&&PHPVS&&-fpm start; \
    &&PHPVS&& -v
