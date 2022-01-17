package IRepositories;

import JavaBean.Contract;

import java.util.List;

public interface IContractRepository {

    Contract getContract(Long ID);

    List<Contract> getContracts();

    void addContract(Contract contract);

    void updateContract(Contract contract);

    void deleteContract(Contract contract);
}
