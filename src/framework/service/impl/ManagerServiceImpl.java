package framework.service.impl;

import framework.dao.ManagerDao;
import framework.dao.impl.ManagerDaoImpl;
import framework.pojo.Manager;
import framework.service.ManagerService;

public class ManagerServiceImpl implements ManagerService {

    ManagerDao managerDao = new ManagerDaoImpl();

    @Override
    public Manager login(Manager manager) {
        return managerDao.login(manager.getName(), manager.getPassword());
    }
}
