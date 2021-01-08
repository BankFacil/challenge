# Explicação do teste de adicionar e remover checkbox

Neste comando estou carregando a página usando um metódo do site_prism.

```
checkbox_page.load
```

Neste comando eu chamo o metódo para clicar no botão para remover o checkbox.

```
checkbox_page.remover_checkbox
```

Neste comando eu verifico se o checkbox não está mais visível na tela.

  ```
  expect(page.has_no_css?('#checkbox')).to eq true
  ```

Nestes comandos eu espero a o texto aparecer e depois valido a mensagem.

  ```
  checkbox_page.wait_for_message
  expect(checkbox_page.message.text).to eq message
  ```

Neste comando eu chamo o metódo para clicar no botão para adicionar o checkbox e depois verifico se o checkbox esta visível na tela.

  ```
  checkbox_page.adicionar_checkbox
  expect(page.has_css?('#checkbox')).to eq true
  ```