name: GitHub Actions - Workflow run Combinado Template
run-name: Running Workflow run Combinado Template

on:
  workflow_run:
    workflows: ["Trigger"]
    types: [requested, completed]
    # branches: [main]  # Opcional: filtro por branch

jobs:
  monitorar_Trigger:
    runs-on: ubuntu-latest
    
    steps:
      - name: Detectar tipo de evento
        run: |
          echo "🔍 DETECTANDO TIPO DE EVENTO"
          echo "================================"
          echo "Ação do evento: ${{ github.event.action }}"
          echo "Status do workflow: ${{ github.event.workflow_run.status }}"
          echo "Conclusão: ${{ github.event.workflow_run.conclusion }}"
          echo "================================"
      
      - name: Executar para evento REQUESTED (início)
        if: github.event.action == 'requested'
        run: |
          echo "🚀 WORKFLOW TRIGGER FOI SOLICITADO/INICIADO"
          echo "----------------------------------------"
          echo "Hora de início: $(date)"
          echo "Branch: ${{ github.event.workflow_run.head_branch }}"
          echo "Commit: ${{ github.event.workflow_run.head_sha }}"
          echo "Evento disparador: ${{ github.event.workflow_run.event }}"
          echo ""
          echo "Ações tomadas (simulação):"
          echo "1. ✅ Notificação de início enviada"
          echo "2. ✅ Recursos alocados"
          echo "3. ✅ Ambiente preparado"
          echo "4. ✅ Validações iniciais OK"
          echo "----------------------------------------"
      
      - name: Executar para evento COMPLETED (término)
        if: github.event.action == 'completed'
        run: |
          echo "🏁 WORKFLOW TRIGGER FOI CONCLUÍDO"
          echo "----------------------------------------"
          echo "Hora de término: $(date)"
          echo "Resultado: ${{ github.event.workflow_run.conclusion }}"
          echo "Branch: ${{ github.event.workflow_run.head_branch }}"
          echo "Commit: ${{ github.event.workflow_run.head_sha }}"
          echo "URL do run: ${{ github.event.workflow_run.html_url }}"
          echo ""
          
          # Lógica baseada no resultado
          if [ "${{ github.event.workflow_run.conclusion }}" = "success" ]; then
            echo "🎉 RESULTADO: SUCESSO!"
            echo "Próximos passos:"
            echo "1. ✅ Iniciar processo de deploy"
            echo "2. ✅ Notificar equipe"
            echo "3. ✅ Registrar métricas"
          elif [ "${{ github.event.workflow_run.conclusion }}" = "failure" ]; then
            echo "❌ RESULTADO: FALHA!"
            echo "Ações de contingência:"
            echo "1. ⚠️ Notificar desenvolvedores"
            echo "2. ⚠️ Registrar erro para análise"
            echo "3. ⚠️ Rollback automático (se aplicável)"
          elif [ "${{ github.event.workflow_run.conclusion }}" = "cancelled" ]; then
            echo "🛑 RESULTADO: CANCELADO"
            echo "Workflow foi cancelado manualmente"
          else
            echo "ℹ️ RESULTADO: ${{ github.event.workflow_run.conclusion }}"
          fi
          echo "----------------------------------------"
      
      - name: Relatório consolidado
        run: |
          echo "📊 RELATÓRIO CONSOLIDADO - WORKFLOW COMBINADO"
          echo "============================================"
          echo "Arquivo: 22-workflow-run-combinado.yaml"
          echo "Funcionalidade: Monitora início E término"
          echo "Eventos capturados: requested + completed"
          echo ""
          echo "Vantagens deste approach combinado:"
          echo "1. 📈 Monitoramento completo do ciclo de vida"
          echo "2. 🎯 Uma única configuração para dois eventos"
          echo "3. 🔄 Lógica centralizada"
          echo "4. 📉 Menos arquivos para gerenciar"
          echo "============================================"
