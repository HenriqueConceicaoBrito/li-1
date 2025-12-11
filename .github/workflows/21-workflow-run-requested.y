name: GitHub Actions - Workflow run Requested Template
run-name: Running Workflow run Requested Template

on:
  workflow_run:
    workflows: ["Trigger"]
    types: [requested]
    # branches: [main]  # Opcional: filtro por branch

jobs:
  quando_Trigger_for_solicitado:
    runs-on: ubuntu-latest
    steps:
      - name: Comentário
        run: echo "Workflow run Requested foi trigado!"
      
      - name: Mostrar informações do workflow solicitado
        run: |
          echo "📢 WORKFLOW SOLICITADO/INICIADO"
          echo "========================================"
          echo "Workflow: ${{ github.event.workflow_run.name }}"
          echo "Status: ${{ github.event.workflow_run.status }}"  # Será "queued" ou "in_progress"
          echo "Branch: ${{ github.event.workflow_run.head_branch }}"
          echo "Commit: ${{ github.event.workflow_run.head_sha }}"
          echo "URL: ${{ github.event.workflow_run.html_url }}"
          echo "Evento que disparou: ${{ github.event.workflow_run.event }}"
          echo "Ação: ${{ github.event.workflow_run.head_repository.full_name }}"
          echo "========================================"
          echo "Este workflow é executado IMEDIATAMENTE quando"
          echo "o workflow 'Trigger' é SOLICITADO/INICIADO,"
          echo "antes mesmo dele começar a executar os jobs!"
      
      - name: Executar em paralelo com o Trigger
        run: |
          echo "⚡ Executando em paralelo com o workflow Trigger"
          echo "Podemos fazer:"
          echo "1. Pré-processamento de dados"
          echo "2. Alocação de recursos"
          echo "3. Notificação de início"
          echo "4. Validações preliminares"
          
          # Exemplo: esperar alguns segundos para simular processamento
          sleep 5
          echo "Pré-processamento concluído!"
