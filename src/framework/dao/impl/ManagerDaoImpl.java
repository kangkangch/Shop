package framework.dao.impl;

import framework.dao.ManagerDao;
import framework.pojo.Manager;

public class ManagerDaoImpl extends BaseDao implements ManagerDao {
    @Override
    public Manager login(String name, String password) {
        String sql = "select `id`,`name`,`password` from manager where name = ? and password = ?";
        return queryForOne(Manager.class, sql, name, password);
    }
}
