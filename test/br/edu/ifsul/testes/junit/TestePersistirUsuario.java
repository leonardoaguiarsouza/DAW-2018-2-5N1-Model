/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifsul.testes.junit;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.modelo.Cidade;
import br.edu.ifsul.modelo.Estado;
import br.edu.ifsul.modelo.PessoaFisica;
import br.edu.ifsul.modelo.Usuario;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
public class TestePersistirUsuario {
    
    EntityManager em;
    
    public TestePersistirUsuario() {
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
            Usuario usu = new Usuario();
            usu.setCpf("888.079.868-50");
            usu.setEmail("jorge.bavaresco@passofundo.ifsul.edu.br");
            usu.setNascimento(new GregorianCalendar(1979, Calendar.OCTOBER,25));
            usu.setNome("Jorge Bavaresco");
            usu.setRg("7541258984");
            usu.setTelefone("(54)99987-8669"); 
            usu.setAtivo(true);
            usu.setNomeUsuario("jorgebavaresco");
            usu.setSenha("123456");
            em.getTransaction().begin();
            em.persist(usu);
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
