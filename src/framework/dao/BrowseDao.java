package framework.dao;

import framework.pojo.Browse;

import java.util.List;

public interface BrowseDao {
    public int addBrowse(Browse browse);

    List<Browse> queryBrowses();

    Integer queryForPageTotalCount();

    List<Browse> queryForPageBrowses(int begin, int pageSize);

    Integer queryForPageTotalCountByUserId(Integer userId);

    List<Browse> queryForPageBrowsesByUserId(int begin, int pageSize, Integer userId);
}
