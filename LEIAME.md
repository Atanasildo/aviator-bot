# 📲 AVIATOR BOT — Guia de Instalação do APK

## O que esta app faz
- Abre o site **ElephantBet** (elephantbet.co.ao) em ecrã cheio
- Mostra uma **barra no topo** com os sinais do Aviator Bot em tempo real
- Notificações flutuantes quando há um sinal de entrada
- Liga ao teu servidor de sinais via SSE

---

## ✅ Pré-requisitos (instalar antes)

### 1. Node.js
- Vai a **https://nodejs.org** → descarrega a versão LTS
- Instala normalmente

### 2. Java 17 ou superior
- Vai a **https://adoptium.net** → descarrega Temurin 17 LTS
- Instala normalmente

### 3. Android Studio (para o SDK)
- Vai a **https://developer.android.com/studio**
- Instala → abre → vai a `Tools > SDK Manager`
- Garante que tens **Android SDK 33+** instalado

---

## 🚀 Como gerar o APK

### Windows
```
1. Clica com o botão direito na pasta do projeto
2. Abre "Terminal" ou "PowerShell"
3. Corre: npm install
4. Corre: npx cap add android
5. Corre: npx cap sync android
6. Corre: cd android
7. Corre: .\gradlew.bat assembleDebug
```

### Mac / Linux
```bash
chmod +x build.sh
./build.sh
```

---

## 📁 Onde está o APK

Após o build, o APK fica em:
```
android/app/build/outputs/apk/debug/app-debug.apk
```

---

## 📲 Instalar no telemóvel Android

### Método 1 — Cabo USB (mais fácil)
1. Liga o telemóvel ao PC por USB
2. No telemóvel: `Definições > Opções de programador > Depuração USB` → Ativar
3. Corre no terminal: `adb install android/app/build/outputs/apk/debug/app-debug.apk`

### Método 2 — Cópia direta
1. Copia o ficheiro `app-debug.apk` para o telemóvel (WhatsApp, cabo, Google Drive...)
2. Abre o ficheiro no telemóvel
3. Aceita instalar de "fontes desconhecidas" se pedido

---

## ⚙️ Usar a app

1. Abre a app **Aviator Bot** no telemóvel
2. O site ElephantBet abre automaticamente
3. Carrega no ícone ⚙️ no canto superior direito
4. Insere o URL do teu servidor de sinais (ex: `http://192.168.1.X:3000`)
5. Carrega em **Ligar ao Servidor**
6. A barra do topo começa a mostrar os sinais!

---

## 🔧 Estrutura do projeto

```
aviator-apk/
├── www/
│   └── index.html      ← App principal (WebView + barra sinais)
├── capacitor.config.json
├── package.json
├── build.sh            ← Script automático (Mac/Linux)
└── LEIAME.md           ← Este ficheiro
```
