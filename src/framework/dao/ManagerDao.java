package framework.dao;

import framework.pojo.Manager;

public interface ManagerDao {
    public Manager login(String name, String password);
}
