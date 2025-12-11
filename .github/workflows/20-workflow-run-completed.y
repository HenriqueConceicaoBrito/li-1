name: GitHub Actions - Workflow run Completed Template
run-name: Running Workflow run Completed Template

on:
  workflow_run:
    workflows: ["Trigger"]
    types: [completed]
    branches: [main]  # Opcional: filtro por branch

jobs:
  quando_Trigger_for_disparado:
    runs-on: ubuntu-latest
    steps:
      - name: Comentário
        run: echo "Workflow run Completed foi trigado!"
      
      - name: Mostrar informações do workflow anterior
        run: |
          echo "Workflow que disparou: ${{ github.event.workflow_run.name }}"
          echo "Resultado: ${{ github.event.workflow_run.conclusion }}"
          echo "Branch: ${{ github.event.workflow_run.head_branch }}"
          echo "Commit SHA: ${{ github.event.workflow_run.head_sha }}"
          echo "URL do run: ${{ github.event.workflow_run.html_url }}"
      
      - name: Executar apenas se o Trigger foi bem-sucedido
        if: github.event.workflow_run.conclusion == 'success'
        run: echo "O workflow Trigger foi bem-sucedido! Continuando..."
      
      - name: Executar apenas se o Trigger falhou
        if: github.event.workflow_run.conclusion == 'failure'
        run: echo "O workflow Trigger falhou. Enviando notificação..."
