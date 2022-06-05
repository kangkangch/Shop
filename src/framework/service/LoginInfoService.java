package framework.service;


import framework.pojo.LoginInfo;
import framework.pojo.Page;

import java.util.List;

public interface LoginInfoService {

    public void addRecord(LoginInfo loginInfo);
    public List<LoginInfo> queryForLoginInfo();

    Page<LoginInfo> page(int pageNo, int pageSize);

    Page<LoginInfo> pageByRole(int pageNo, int pageSize, String role);
}
