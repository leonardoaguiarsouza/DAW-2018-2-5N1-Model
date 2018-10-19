package br.edu.ifsul.testes;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.modelo.Pais;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author Prof. Me. Jorge Luis Boeira Bavaresco
 * @email jorge.bavaresco@passofundo.ifsul.edu.br
 * @organization IFSUL - Campus Passo Fundo
 */
public class TesteListarPais {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntityManager em = EntityManagerUtil.getEntityManager();
        // no from deve ser informado o nome da classe e não da tabela
        List<Pais> lista = em.createQuery("from Pais order by nome").getResultList();
        for (Pais p : lista){
            System.out.println("ID: " + p.getId() + 
                    " Nome: " + p.getNome() + " ISO: " + p.getIso());
        }
    }

}
