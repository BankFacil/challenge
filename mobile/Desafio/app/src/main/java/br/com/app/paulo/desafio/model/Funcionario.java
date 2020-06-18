package br.com.app.paulo.desafio.model;

/**
 * Created by pvnluz on 25/04/2017.
 */

public class Funcionario {

    private String nome;
    private String sobrenome;
    private String urlImagem;

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUrlImagem() {
        return urlImagem;
    }

    public void setUrlImagem(String urlImagem) {
        this.urlImagem = urlImagem;
    }
}
