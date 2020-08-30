import os
import pytest
import testinfra.utils.ansible_runner


testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


@pytest.mark.parametrize("dirs", [
    "/mnt/data/prometheus"
])
def test_dirs(host, dirs):
    d = host.file(dirs)
    assert d.is_directory
    assert d.exists


def test_user(host):
    assert host.group("prometheus").exists
    assert host.user("prometheus").exists
