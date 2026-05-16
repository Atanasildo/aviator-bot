#!/bin/bash
# ═══════════════════════════════════════════════════════
#  AVIATOR BOT — Script de Build do APK
#  Corre este script na pasta do projeto
# ═══════════════════════════════════════════════════════

set -e

VERDE='\033[0;32m'
AMARELO='\033[1;33m'
AZUL='\033[0;34m'
VERMELHO='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${AZUL}╔══════════════════════════════════════╗${NC}"
echo -e "${AZUL}║        AVIATOR BOT — APK BUILD       ║${NC}"
echo -e "${AZUL}╚══════════════════════════════════════╝${NC}"
echo ""

# ── 1. Verificar Node.js ──────────────────────────────
echo -e "${AMARELO}[1/6] A verificar Node.js...${NC}"
if ! command -v node &> /dev/null; then
  echo -e "${VERMELHO}❌ Node.js não encontrado!${NC}"
  echo "Instala em: https://nodejs.org"
  exit 1
fi
echo -e "${VERDE}✅ Node.js $(node --version)${NC}"

# ── 2. Verificar Java ────────────────────────────────
echo -e "${AMARELO}[2/6] A verificar Java...${NC}"
if ! command -v java &> /dev/null; then
  echo -e "${VERMELHO}❌ Java não encontrado!${NC}"
  echo "Instala Java 17+: https://adoptium.net"
  exit 1
fi
echo -e "${VERDE}✅ $(java --version 2>&1 | head -1)${NC}"

# ── 3. Instalar dependências ─────────────────────────
echo -e "${AMARELO}[3/6] A instalar dependências npm...${NC}"
npm install
echo -e "${VERDE}✅ Dependências instaladas${NC}"

# ── 4. Adicionar plataforma Android ──────────────────
echo -e "${AMARELO}[4/6] A adicionar plataforma Android...${NC}"
if [ ! -d "android" ]; then
  npx cap add android
  echo -e "${VERDE}✅ Plataforma Android adicionada${NC}"
else
  echo -e "${VERDE}✅ Plataforma Android já existe${NC}"
fi

# ── 5. Sincronizar ficheiros ──────────────────────────
echo -e "${AMARELO}[5/6] A sincronizar ficheiros...${NC}"
npx cap sync android
echo -e "${VERDE}✅ Sincronizado${NC}"

# ── 6. Compilar APK ──────────────────────────────────
echo -e "${AMARELO}[6/6] A compilar APK (pode demorar 3-5 min)...${NC}"
cd android
./gradlew assembleDebug 2>&1

APK_PATH="app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK_PATH" ]; then
  echo ""
  echo -e "${VERDE}╔══════════════════════════════════════╗${NC}"
  echo -e "${VERDE}║          ✅ APK GERADO!              ║${NC}"
  echo -e "${VERDE}╚══════════════════════════════════════╝${NC}"
  echo ""
  echo -e "${AZUL}📁 Localização:${NC}"
  echo "   android/app/build/outputs/apk/debug/app-debug.apk"
  echo ""
  echo -e "${AZUL}📲 Para instalar no telemóvel:${NC}"
  echo "   1. Liga o telemóvel ao PC por USB"
  echo "   2. Ativa 'Depuração USB' nas opções de programador"
  echo "   3. Corre: adb install $APK_PATH"
  echo "   OU copia o ficheiro .apk para o telemóvel e abre-o"
  echo ""
else
  echo -e "${VERMELHO}❌ Erro ao gerar APK. Vê o erro acima.${NC}"
  exit 1
fi
