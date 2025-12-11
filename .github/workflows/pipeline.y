# Nome da sua pipeline (aparecerá na aba Actions)
name: Pipeline de CI Básica

# DEFINE O GATILHO: Quando ela será executada?
on:
  push: # Executa quando há um push no repositório
    branches: [ main, master ] # Apenas nos branches main/master
  pull_request: # Executa também quando um Pull Request é aberto ou atualizado
    branches: [ main, master ]

# DEFINE OS JOBS: O que será feito?
jobs:
  # Primeiro Job: "executar-testes"
  executar-testes:
    # Nome amigável do job
    name: Executar Testes com Node.js
    # Máquina virtual onde o job irá rodar
    runs-on: ubuntu-latest

    # PASSOS: Sequência de comandos/ações dentro do job
    steps:
      # Passo 1: Baixar (checkout) o código do repositório
      - name: Fazer checkout do código
        uses: actions/checkout@v4 # Ação oficial para baixar código

      # Passo 2: Configurar o ambiente Node.js
      - name: Configurar Node.js
        uses: actions/setup-node@v4
        with: # Parâmetros para a ação
          node-version: '18' # Versão do Node

      # Passo 3: Instalar as dependências do projeto
      - name: Instalar Dependências
        run: npm ci # Usa o package-lock.json para instalação precisa

      # Passo 4: Rodar os testes definidos no script "test" do package.json
      - name: Rodar Testes
        run: npm test
