### Updating Dev Essentials on Ubuntu for npm/React Setup

---

## Setting Up npm and React on Ubuntu (for Olympiad-AI-Gamify)

### Prerequisites
- Ubuntu 20.04+ (tested on 22.04 LTS).
- Sudo access.
- Internet connection.
- (Optional) If maintaining `my-dev-essential` as a bash script: Edit `update_dev_essentials.sh` and add the Node.js section below.

### Step 1: Update System Packages
Always start fresh to avoid conflicts.
```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Node.js and npm (LTS Version)
Use the official NodeSource repository for the latest LTS (v20.x as of Oct 2025). This includes npm.

1. Install prerequisites:
   ```bash
   sudo apt install -y curl software-properties-common ca-certificates lsb-release
   ```

2. Add NodeSource GPG key and repo:
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   ```

3. Install Node.js (includes npm):
   ```bash
   sudo apt install -y nodejs
   ```

4. (Optional) If integrating into `my-dev-essential` script:
   ```bash
   # In update_dev_essentials.sh
   echo "Installing Node.js LTS..."
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   sudo apt install -y nodejs
   ```

### Step 3: Verify Installation
Check versions to confirm.
```bash
node --version  # Should output v20.x.x
npm --version   # Should output 10.x.x or higher
```
### Step 4: Scaffold TS React Aoo
npx create-react-app client --template typescript  # Creates 'client' subfolder with TS
cd client

### Step 5: Install Project Deps
```bash
npm install firebase @google-cloud/vertexai react-router-dom  # Core for your stack
npm install --save-dev @types/node  # Extra for env vars if needed
```

Step 5: Add Firebase Config (Reuse Yours)
Create src/firebase.ts and paste your config (from earlier):
typescript// src/firebase.ts
import { initializeApp } from 'firebase/app';
import { getAuth } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';

const firebaseConfig = {
  apiKey: "YOUR_API_KEY",  // Your masked one
  authDomain: "olympiad-ai-gamify.firebaseapp.com",
  projectId: "olympiad-ai-gamify",
  storageBucket: "olympiad-ai-gamify.firebasestorage.app",
  messagingSenderId: "620019980669",
  appId: "1:620019980669:web:786493a9dcd16ba7189414",
  measurementId: "G-970VJVE2MV"
};

const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
export const db = getFirestore(app);

