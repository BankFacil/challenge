# Explicação do teste de abrir nova aba.


Neste comando estou carregando a página usando um metódo do site_prism.

```
nova_aba.load
```

Neste comando estou chamando o metodo para abrir a nova aba e estou mudando o foco para a ultima aba aberta

```
nova_aba.abrir_nova_aba
switch_to_window windows.last
```

Nestes comandos estou validando a url e validando o texto denta na página aberta

```
  expect(page).to have_current_path(CONFIG['new_url'], url: true)
  expect(nova_aba.texto_nova_aba.text).to eq 'New Window'
```