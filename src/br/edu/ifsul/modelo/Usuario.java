package br.edu.ifsul.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author Prof. Me. Jorge Luis Boeira Bavaresco
 * @email jorge.bavaresco@passofundo.ifsul.edu.br
 * @organization IFSUL - Campus Passo Fundo
 */
@Entity
@Table(name = "usuario")
public class Usuario extends PessoaFisica implements Serializable {

    @Length(max = 20, message = "O nome de usuário não pode ter mais de {max} caracteres")
    @NotNull(message = "O nome de usuário não pode ser nulo")
    @NotBlank(message = "O Nome de usuário não pode ser em branco")
    @Column(name = "nome_usuario", length = 20, nullable = false, unique = true)    
    private String nomeUsuario;
    @Length(max = 20, message = "A senha não pode ter mais de {max} caracteres")
    @NotNull(message = "A senha não pode ser nula")
    @NotBlank(message = "A senha não pode ser em branco")
    @Column(name = "senha", length = 20, nullable = false)      
    private String senha;
    @NotNull(message = "Informe se o usuário está ativo")
    @Column(name = "ativo", nullable = false)
    private Boolean ativo;

    public Usuario() {
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }
            
}
