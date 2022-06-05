package framework.service.impl;

import framework.dao.BrowseDao;
import framework.dao.impl.BrowseDaoImpl;
import framework.pojo.Browse;
import framework.pojo.Goods;
import framework.pojo.Page;
import framework.service.BrowseService;

import java.util.List;

public class BrowseServiceImpl implements BrowseService {

    private BrowseDao browseDao = new BrowseDaoImpl();

    @Override
    public void addBrowse(Browse browse) { browseDao.addBrowse(browse); }

    @Override
    public List<Browse> queryBrowse() {
        return browseDao.queryBrowses();
    }

    @Override
    public Page<Browse> page(int pageNo, int pageSize) {
        Page<Browse> page = new Page<>();

        page.setPageNo(pageNo);

        page.setPageSize(pageSize);

        Integer pageTotalCount = browseDao.queryForPageTotalCount();
        page.setPageTotalCount(pageTotalCount);

        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0){
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);

        int begin = (pageNo-1)*pageSize;
        List<Browse> items = browseDao.queryForPageBrowses(begin, pageSize);

        page.setItems(items);
        return page;
    }

    @Override
    public Page<Browse> pageByUserId(int pageNo, int pageSize, int userId) {
        Page<Browse> page = new Page<>();

        page.setPageNo(pageNo);

        page.setPageSize(pageSize);

        Integer pageTotalCount = browseDao.queryForPageTotalCountByUserId(userId);
        page.setPageTotalCount(pageTotalCount);

        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0){
            pageTotal+=1;
        }
        page.setPageTotal(pageTotal);

        int begin = (pageNo-1)*pageSize;
        List<Browse> items = browseDao.queryForPageBrowsesByUserId(begin, pageSize,userId);
        page.setItems(items);
        return page;
    }
}
