package Repositories;

import Helpers.HibernateUtil;
import IRepositories.IContractRepository;
import JavaBean.Contract;
import JavaBean.Movie;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ContractRepository implements IContractRepository {

    @Override
    public Contract getContract(Long ID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Contract contract = session.load(Contract.class, ID);
        session.close();
        return contract;
    }

    @Override
    public List<Contract> getContracts() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Contract> contractList = session.createQuery("SELECT a FROM Contract a", Contract.class).getResultList();
        session.close();
        return contractList;
    }

    @Override
    public void addContract(Contract contract) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(contract);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateContract(Contract contract) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(contract);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteContract(Contract contract) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(contract);
        transaction.commit();
        session.close();
    }
}
