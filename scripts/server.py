ruta = '/etc/apache2/sites-available/000-default.conf'

script = """
<VirtualHost *:80>
    DirectoryIndex index.php index.html index.htm
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    # For most configuration files from conf-available/, which are
    # enabled or disabled at a global level, it is possible to
    # include a line for only one particular virtual host. For example the
    # following line enables the CGI configuration for this host only
    # after it has been globally disabled with "a2disconf".
    #Include conf-available/serve-cgi-bin.conf
</VirtualHost>
"""

try:
    with open(ruta, 'w') as archivo:
        archivo.write(script)

except Exception:
    print("Fallo 1")