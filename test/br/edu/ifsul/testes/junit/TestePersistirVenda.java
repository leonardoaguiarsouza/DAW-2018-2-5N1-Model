/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifsul.testes.junit;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.modelo.Categoria;
import br.edu.ifsul.modelo.Cidade;
import br.edu.ifsul.modelo.Estado;
import br.edu.ifsul.modelo.PessoaFisica;
import br.edu.ifsul.modelo.Produto;
import br.edu.ifsul.modelo.Usuario;
import br.edu.ifsul.modelo.Venda;
import br.edu.ifsul.modelo.VendaItens;
import javax.persistence.EntityManager;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author jorge
 */
public class TestePersistirVenda {
    
    EntityManager em;
    
    public TestePersistirVenda() {
    }
    
    @Before
    public void setUp() {
        em = EntityManagerUtil.getEntityManager();
    }
    
    @After
    public void tearDown() {
        em.close();
    }
    
    @Test
    public void teste(){
        boolean exception = false;
        try {
            Venda v = new Venda();
            v.setPessoaFisica(em.find(PessoaFisica.class, 1));
            v.setUsuario(em.find(Usuario.class, 2));
            v.setQuantidadeParcelas(4);
            // adicionando um item na venda
            VendaItens vi = new VendaItens();
            vi.setProduto(em.find(Produto.class, 1));
            vi.setValorUnitario(vi.getProduto().getPreco());
            vi.setQuantidade(2.0);
            vi.setValorTotal(vi.getQuantidade() * vi.getValorUnitario());
            v.adicionarItem(vi);     
            v.gerarParcelas();
            em.getTransaction().begin();
            em.persist(v);
            em.getTransaction().commit();
        } catch (Exception e){
            exception = true;
            e.printStackTrace();
        }
        /*
        O método abaixo verifica se o valor esperado (false) é
        igual ao valor do atributo exception, que vai indicar se ocorreu ou não erro.
        Se não ocorrer erro o teste passa. 
        */
        Assert.assertEquals(false, exception);
    }
    
}
