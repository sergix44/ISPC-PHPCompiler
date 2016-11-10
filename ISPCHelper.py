import json
import platform
import sys
import distutils.version
import urllib2

__version__ = 1.0

SUPPORTED_PLATFORMS = ['ubuntu', 'debian', '', 'linuxmint']  # '' for develop under windows

PHPMYADMIN_INSTALL_PATH = '/var/www/apps/phpmyadmin'
ROUNDCUBE_INSTALL_PATH = '/var/www/apps/roundcube'
PHP_INSTALL_PATH = '/opt/php-{0}'


def parse_json(url):
	response = urllib2.urlopen(url)
	data = response.read().decode('utf-8')
	return json.loads(data)


def install_roundcube():
	last_release = parse_json('https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest')


def install_phpmyadmin():
	last_release = parse_json('https://api.github.com/repos/roundcube/roundcubemail/releases/latest')


def install_update_php(version):
	pass


def php_menu():
	php_versions = parse_json('https://raw.githubusercontent.com/SergiX44/ISPCHelper/master/php_versions.json')

	versions = {}
	i = 1
	for v in php_versions['versions']:
		print(str(i) + ') Update/install PHP ' + v['name'])
		versions[str(i)] = v
		i += 1

	sel = raw_input('\nChoose an option: ')
	if sel not in versions:
		print('Invalid selection.')
		main_menu()
	else:
		install_update_php(versions[sel])


def main_menu():
	print('1) Manage PHP Additional Versions')
	print('2) Install/update latest phpMyAdmin')
	print('3) Install/update latest Roundcube')

	menu = {
		'1': php_menu,
		'2': install_phpmyadmin,
		'3': install_roundcube
	}

	sel = raw_input('\nChoose an option: ')
	run_menu(sel, menu, main_menu)


def run_menu(sel, menu, caller):
	if sel in menu:
		menu[sel]()
	else:
		print('Invalid selection.')
		caller()


if __name__ == '__main__':
	print('-*- ISPConfig Helper {0} -*-\n'.format(__version__))

	if platform.dist()[0].lower() not in SUPPORTED_PLATFORMS:
		print('Your distribution is not supported.')
		sys.exit(1)
	main_menu()
