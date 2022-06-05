package framework.service;

import framework.pojo.Browse;
import framework.pojo.Page;
import java.util.List;

public interface BrowseService {
    public void addBrowse(Browse browse);

    List<Browse> queryBrowse();

    Page<Browse> page(int pageNo, int pageSize);

    Page<Browse> pageByUserId(int pageNo, int pageSize, int userId);
}
