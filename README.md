# 馃殌 瓒呯妯″紡 - DSH Agent 棰勮

[English](#english) | [涓枃](#涓枃)

---

<a id="english"></a>
## 馃専 English

### Overview

**Super Mode** is an elite-tier agent preset for DeepSeek Harness (DSH) that transforms your coding agent into a principal-level engineer. It features enhanced reasoning capabilities, optimized context retention, and strengthened multi-agent collaboration.

### 鉁?Key Features

- **Principal Engineer Persona**: First-principles thinking, systems-level awareness, proactive analysis
- **Full-Stack Mastery**: Deep expertise across TypeScript/Python/Rust/Go, React/Vue/Next.js, Docker/K8s, databases, and AI/ML
- **Enhanced Context Retention**: 2x compression threshold (16KB vs 8KB), preserving more conversation history
- **Strengthened Collaboration**: 128-round Ralph iterations (vs 64), better multi-agent coordination
- **Optimized Tool Configuration**: Larger instruction context (128KB vs 64KB), parallel task support

### 馃搳 Performance Comparison

| Feature | Standard Mode | Super Mode | Improvement |
|---------|---------------|------------|-------------|
| Instruction Context | 64KB | **128KB** | +100% |
| Compression Threshold | 8KB | **16KB** | +100% |
| Head Retention | 4KB | **8KB** | +100% |
| Tail Retention | 1KB | **4KB** | +300% |
| Ralph Iterations | 64 rounds | **128 rounds** | +100% |
| Persona Depth | Basic | **Principal Engineer** | 猸愨瓙猸?|

### 馃挵 Token Consumption

- **Per Request Overhead**: ~2,000-5,000 additional tokens (~20-30% more than standard)
- **Trade-off**: Higher token cost for stronger reasoning and better context memory
- **Best For**: Complex architecture design, large-scale refactoring, deep debugging, full-stack development

### 馃摝 Installation

#### One-Click Install (Recommended)

**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/liulei0803/dsh-super-mode-preset/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/liulei0803/dsh-super-mode-preset/main/install.ps1 | iex
```

#### Manual Installation

1. Download or clone this repository:
   ```bash
   git clone https://github.com/liulei0803/dsh-super-mode-preset.git
   cd dsh-super-mode-preset
   ```

2. Copy the `super-mode` directory to your DSH presets folder:
   - **Windows**: `%USERPROFILE%\.dsh\.agent-presets\super-mode\`
   - **macOS/Linux**: `~/.dsh/.agent-presets/super-mode/`

3. Restart DSH Desktop

4. Select "瓒呯妯″紡" (Super Mode) from the preset selector when creating a new session

### 馃幆 Use Cases

- 馃敟 Complex architecture design and refactoring
- 馃敟 Large-scale changes across multiple files
- 馃敟 Deep reasoning for difficult bugs
- 馃敟 Full-stack feature development (frontend + backend + infrastructure)
- 馃敟 Performance optimization and system tuning
- 馃敟 Parallel processing of multiple independent tasks

### 馃摑 License

MIT License - see [LICENSE](LICENSE) file for details

---

<a id="涓枃"></a>
## 馃専 涓枃

### 姒傝堪

**瓒呯妯″紡** 鏄?DeepSeek Harness (DSH) 鐨勭粓鏋佸寮?Agent 棰勮锛屽皢浣犵殑缂栫爜 Agent 杞彉涓洪甯伐绋嬪笀绾у埆銆傚叿澶囨繁搴︽帹鐞嗚兘鍔涖€佷紭鍖栫殑涓婁笅鏂囦繚鎸佺瓥鐣ュ拰寮哄寲鐨勫浠ｇ悊鍗忎綔銆?
### 鉁?鏍稿績鐗规€?
- **棣栧腑宸ョ▼甯堜汉璁?*锛氱涓€鎬у師鐞嗘€濈淮銆佺郴缁熺骇鎰熺煡銆佷富鍔ㄥ垎鏋愯兘鍔?- **鍏ㄦ爤绮鹃€?*锛氭繁搴︽帉鎻?TypeScript/Python/Rust/Go銆丷eact/Vue/Next.js銆丏ocker/K8s銆佹暟鎹簱鍜?AI/ML
- **澧炲己涓婁笅鏂囦繚鎸?*锛? 鍊嶅帇缂╅槇鍊硷紙16KB vs 8KB锛夛紝淇濈暀鏇村瀵硅瘽鍘嗗彶
- **寮哄寲鍗忎綔鑳藉姏**锛?28 杞?Ralph 杩唬锛坴s 64锛夛紝鏇村ソ鐨勫浠ｇ悊鍗忚皟
- **浼樺寲宸ュ叿閰嶇疆**锛氭洿澶х殑鎸囦护涓婁笅鏂囷紙128KB vs 64KB锛夛紝鏀寔骞惰浠诲姟

### 馃搳 鎬ц兘瀵规瘮

| 鐗规€?| 鏍囧噯妯″紡 | 瓒呯妯″紡 | 鎻愬崌 |
|------|---------|---------|------|
| 鎸囦护涓婁笅鏂?| 64KB | **128KB** | +100% |
| 鍘嬬缉闃堝€?| 8KB | **16KB** | +100% |
| 澶撮儴淇濈暀 | 4KB | **8KB** | +100% |
| 灏鹃儴淇濈暀 | 1KB | **4KB** | +300% |
| Ralph 杩唬 | 64 杞?| **128 杞?* | +100% |
| 浜鸿娣卞害 | 鍩虹 | **棣栧腑宸ョ▼甯?* | 猸愨瓙猸?|

### 馃挵 Token 娑堣€?
- **姣忚疆璇锋眰棰濆寮€閿€**锛殈2,000-5,000 tokens锛堟瘮鏍囧噯妯″紡澶?~20-30%锛?- **鏉冭　**锛氭洿楂樼殑 token 鎴愭湰锛屾崲鏉ユ洿寮虹殑鎺ㄧ悊鍜屼笂涓嬫枃璁板繂
- **閫傜敤鍦烘櫙**锛氬鏉傛灦鏋勮璁°€佸ぇ瑙勬ā閲嶆瀯銆佹繁搴﹁皟璇曘€佸叏鏍堝紑鍙?
### 馃摝 瀹夎鏂规硶

#### 涓€閿畨瑁咃紙鎺ㄨ崘锛?
**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/liulei0803/dsh-super-mode-preset/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/liulei0803/dsh-super-mode-preset/main/install.ps1 | iex
```

#### 鎵嬪姩瀹夎

1. 涓嬭浇鎴栧厠闅嗘湰浠撳簱锛?   ```bash
   git clone https://github.com/liulei0803/dsh-super-mode-preset.git
   cd dsh-super-mode-preset
   ```

2. 灏?`super-mode` 鐩綍澶嶅埗鍒?DSH 棰勮鏂囦欢澶癸細
   - **Windows**: `%USERPROFILE%\.dsh\.agent-presets\super-mode\`
   - **macOS/Linux**: `~/.dsh/.agent-presets/super-mode/`

3. 閲嶅惎 DSH Desktop

4. 鍒涘缓鏂颁細璇濇椂锛屽湪棰勮閫夋嫨鍣ㄤ腑閫夋嫨銆岃秴绁炴ā寮忋€?
### 馃幆 閫傜敤鍦烘櫙

- 馃敟 澶嶆潅鏋舵瀯璁捐鍜岄噸鏋?- 馃敟 璺ㄥ鏂囦欢鐨勫ぇ瑙勬ā鏀瑰姩
- 馃敟 闇€瑕佹繁搴︽帹鐞嗙殑鐤戦毦 bug
- 馃敟 鍏ㄦ爤鍔熻兘寮€鍙戯紙鍓嶇 + 鍚庣 + 鍩虹璁炬柦锛?- 馃敟 鎬ц兘浼樺寲鍜岀郴缁熻皟浼?- 馃敟 骞惰澶勭悊澶氫釜鐙珛浠诲姟

### 馃摑 璁稿彲璇?
MIT 璁稿彲璇?- 璇﹁ [LICENSE](LICENSE) 鏂囦欢

---

## 馃檹 Credits

Created for the DeepSeek Harness community. Built with 鉂わ笍 for developers who demand excellence.

涓?DeepSeek Harness 绀惧尯鍒涘缓銆備负杩芥眰鍗撹秺鐨勫紑鍙戣€呯敤蹇冩墦閫犮€?