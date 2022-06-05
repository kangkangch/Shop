package framework.service;

import framework.pojo.Operation;
import framework.pojo.Page;

public interface OperationService {

    public void addOperation(Operation operation);

    Page<Operation> page(int pageNo, int pageSize);
}
