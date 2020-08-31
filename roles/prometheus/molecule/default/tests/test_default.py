import os
import pytest
import testinfra.utils.ansible_runner


testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_user(host):
    assert host.group("prometheus").exists
    assert host.user("prometheus").exists


@pytest.mark.parametrize("dirs", [
    "/mnt/data/prometheus"
])
def test_dirs(host, dirs):
    d = host.file(dirs)
    assert d.is_directory
    assert d.exists


@pytest.mark.parametrize('svc', [
  'prometheus'
])
def test_svc(host, svc):
    service = host.service(svc)

    assert service.is_running
    assert service.is_enabled
