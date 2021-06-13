import os
import pytest
import testinfra.utils.ansible_runner


testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


@pytest.mark.parametrize("files", [
    "/etc/ddclient.conf"
])
def test_dirs(host, files):
    f = host.file(files)
    assert f.is_file
    assert f.exists


@pytest.mark.parametrize('svc', [
  'ddclient'
])
def test_svc(host, svc):
    service = host.service(svc)

    assert service.is_running
    assert service.is_enabled
