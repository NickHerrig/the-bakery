import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


@pytest.mark.parametrize('pkg', [
   'ntfs-3g',
])
def test_installed_pkg(host, pkg):
    package=host.package(pkg)

    assert package.is_installed


def  test_directorie(host):
    d = host.file('/mnt/data')

    assert d.is_directory
    assert d.exists
