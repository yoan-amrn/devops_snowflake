# Changelog

All notable changes to this project will be documented in this file.

## [1.5.0](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.4.2..v1.5.0) - 2025-02-20

### ⛰️  Features

- Add github wkf to automatically generate changelog upon release ([#21](https://github.com/Sanofi-Accelerator/Marketing-Suite-US//issues/21)) - ([d763736](https://github.com/Sanofi-GitHub/snowflake-automate/commit/d763736d60487f87f80445d59edae356c244f16e))

### ⚙️ Miscellaneous Tasks

- Update snowsql version ([#19](https://github.com/Sanofi-Accelerator/Marketing-Suite-US//issues/19)) - ([652860f](https://github.com/Sanofi-GitHub/snowflake-automate/commit/652860f80b22e47d808b3bcf2ee08ed2ebdb977b))

### 🛡️ Security

- Add support for key pair authentication ([#23](https://github.com/Sanofi-Accelerator/Marketing-Suite-US//issues/23)) - ([a16a7b6](https://github.com/Sanofi-GitHub/snowflake-automate/commit/a16a7b6f2d2882f80bcbb688a4b2c1b9ffa04077))
## [1.4.2](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.4.1..v1.4.2) - 2024-10-09

### 🐛 Bug Fixes

- Allow specifying the scripts root dir for init job - ([a21e622](https://github.com/Sanofi-GitHub/snowflake-automate/commit/a21e622a86a987116649d8c08f70b60cc3fd59c7))
- Use atmos shared runner in template workflows - ([b03739a](https://github.com/Sanofi-GitHub/snowflake-automate/commit/b03739a0ee5de2cb2ee5f6e69462b5b4a8ba763c))
## [1.4.1](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.4.0..v1.4.1) - 2024-08-07

### 🐛 Bug Fixes

- Github actions unable to fetch some archives - ([b49df1a](https://github.com/Sanofi-GitHub/snowflake-automate/commit/b49df1a025678ad5985905e015828e6bfb2c899f))

### ⚙️ Miscellaneous Tasks

- Move sample workflows to dedicated folder - ([ea484e2](https://github.com/Sanofi-GitHub/snowflake-automate/commit/ea484e223136c58f9a1f59a42892db8fc4c1ea7b))
- Upgrade checkout to v4 - ([f40093d](https://github.com/Sanofi-GitHub/snowflake-automate/commit/f40093d05d1352f817dddec8153340bacdc63cce))
## [1.4.0](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.3.3..v1.4.0) - 2024-08-06

### 🐛 Bug Fixes

- Correct apt package for envsubst - ([266484b](https://github.com/Sanofi-GitHub/snowflake-automate/commit/266484bf9541272693330ac9696876c476e11925))
- Remove bashrc & PATH modifications - ([8921b60](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8921b605dc34d3198abd31e9dd6eaa68e53d9959))
- Add envsubst install - ([ca52a38](https://github.com/Sanofi-GitHub/snowflake-automate/commit/ca52a38ee9c8c1b097dfaa27adebe828524e39a9))
- Add snowsql install path to PATH var - ([f5c0b0d](https://github.com/Sanofi-GitHub/snowflake-automate/commit/f5c0b0d1c35c342a12010a18e20764791a350a99))
- Add snowsql install path to PATH var - ([1f2dac9](https://github.com/Sanofi-GitHub/snowflake-automate/commit/1f2dac970d3da8a029aa88d55d93ddd865e5f45d))
- Make sure unzip is installed - ([9fa4eb2](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9fa4eb2cc99ee4bc93f8f62118b7f115c64beb5e))
- Make sure curl is installed - ([434dbae](https://github.com/Sanofi-GitHub/snowflake-automate/commit/434dbae47fec406c476d7accedd7a7054af5cfe6))

### 🧪 Testing

- Remove install check - ([374334b](https://github.com/Sanofi-GitHub/snowflake-automate/commit/374334bac0d8e1571ea10a767452d729c2517838))
- Modify PATH inside deploy script - ([e9b34b4](https://github.com/Sanofi-GitHub/snowflake-automate/commit/e9b34b491468037d802b18eefffed55aa5a65e48))
- Show PATH as first step - ([5553cce](https://github.com/Sanofi-GitHub/snowflake-automate/commit/5553ccea7301bc673160391cf8e9efbef67a1038))
- Add +x permission to exec - ([70c657d](https://github.com/Sanofi-GitHub/snowflake-automate/commit/70c657d758a1db2d363b84832be77b05fce198d0))
- Show install results of snowsql for prep step - ([bd751c2](https://github.com/Sanofi-GitHub/snowflake-automate/commit/bd751c222f4986de1ea42270221ed82ff8a5ebac))
- Show install results of snowsql - ([c97ab60](https://github.com/Sanofi-GitHub/snowflake-automate/commit/c97ab60b0aede406679a16e947b78d5224a25b44))
- See if command is known - ([32400b5](https://github.com/Sanofi-GitHub/snowflake-automate/commit/32400b587e672daaeaab5738bf0cd7e1d6d0afe3))
- Show content of install dir or snowsql - ([8ba2e0a](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8ba2e0aa56e48095ace0f1c2055850a2012625b7))
- Show content of bashrc - ([5648ba3](https://github.com/Sanofi-GitHub/snowflake-automate/commit/5648ba339a9591c2d5ffe3025b4717948448c2b6))
## [1.3.3](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.3.2..v1.3.3) - 2024-07-04

### ⛰️  Features

- Allow specific selection of target environment (instead of default branch name - ([ce5994f](https://github.com/Sanofi-GitHub/snowflake-automate/commit/ce5994fd26d361f1f60b29a5233f87ca12b7f944))

### 🐛 Bug Fixes

- Change method to list sql scripts in folder (and subfolders) - ([e022cf9](https://github.com/Sanofi-GitHub/snowflake-automate/commit/e022cf9878cb261a13355f6742dd90b5779e6c02))
- More verbose logging - ([846d4cc](https://github.com/Sanofi-GitHub/snowflake-automate/commit/846d4cc7739ca444def9f5f5c9ae4a823c558e00))
- Force env file name to be lowercase - ([c3532b1](https://github.com/Sanofi-GitHub/snowflake-automate/commit/c3532b1aa0f17c23532e79ac54c4977838c8cb06))

### ⚙️ Miscellaneous Tasks

- Update artifacts related actions to v4 - ([4f6521a](https://github.com/Sanofi-GitHub/snowflake-automate/commit/4f6521aff475a6c5cdb92732fea47325442093be))
## [1.3.2](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.3.1..v1.3.2) - 2023-07-13

### 🐛 Bug Fixes

- Rename uploaded artifact - ([0a6fb23](https://github.com/Sanofi-GitHub/snowflake-automate/commit/0a6fb236d08d0de2dd4f70582ca6faeb08d8c315))
## [1.3.1](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.3.0..v1.3.1) - 2023-07-13

### 🐛 Bug Fixes

- Use ARTIFACT_NAME in env variable - ([2ad7046](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2ad70463dc05f50ad41e7ddb84f2644fbd3f141a))
## [1.3.0](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.2.0..v1.3.0) - 2023-07-13

### ⛰️  Features

- Allow custom names for artifacts - ([3bee291](https://github.com/Sanofi-GitHub/snowflake-automate/commit/3bee29175da073b0316be387022e05d10f2b589e))

### 🐛 Bug Fixes

- Remove mention of removed method - ([b403af3](https://github.com/Sanofi-GitHub/snowflake-automate/commit/b403af38dec8a4b0db5daa6de3dd2f252fa69f3e))
## [1.2.0](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.1.1..v1.2.0) - 2023-07-07

### ⛰️  Features

- Better support for tests ([#7](https://github.com/Sanofi-Accelerator/Marketing-Suite-US//issues/7)) - ([5a6bfe2](https://github.com/Sanofi-GitHub/snowflake-automate/commit/5a6bfe22353d3676d55f9a851e0ef87459d49a24))
## [1.1.1](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.1.0..v1.1.1) - 2023-06-07

### ⛰️  Features

- Add testing capabilities - ([ecfed3f](https://github.com/Sanofi-GitHub/snowflake-automate/commit/ecfed3ff58790f8ad45506a54a5c4e2201ab0522))
- Add lint automated action - ([fce4997](https://github.com/Sanofi-GitHub/snowflake-automate/commit/fce4997fc913fa183291895ce9bb121c5f0c711b))

### 🐛 Bug Fixes

- Only substitute vars defined in the .env file - ([90e6259](https://github.com/Sanofi-GitHub/snowflake-automate/commit/90e62593891a3856d3e889bb6abd22416f6e7ece))
- Small QOL changes - ([78ab542](https://github.com/Sanofi-GitHub/snowflake-automate/commit/78ab542bb6a891964e20186959f3b589862b2995))
- Allow 'usage' call without env & deps - ([6832bee](https://github.com/Sanofi-GitHub/snowflake-automate/commit/6832bee193b0e95bfcc7eb797fad3552a86734d8))
- Add root dir option information in usage - ([9ca0d4d](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9ca0d4dc4af3cc9d71e394019706f6ee3481df46))

### ⚙️ Miscellaneous Tasks

- Fix source error from shellcheck - ([d6a49af](https://github.com/Sanofi-GitHub/snowflake-automate/commit/d6a49af783e439767feafe6561ec523bda45ad36))
- Apply shfmt linting - ([16543f0](https://github.com/Sanofi-GitHub/snowflake-automate/commit/16543f05582636a7bedb6428ba107960bd81b470))
- Solve yamllint issue - ([68c5fc0](https://github.com/Sanofi-GitHub/snowflake-automate/commit/68c5fc097509f6ae9eedee550b78679d981da8a0))
## [1.1.0](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.0.1..v1.1.0) - 2023-06-02

### ⛰️  Features

- Add @latest tag - ([fa944dc](https://github.com/Sanofi-GitHub/snowflake-automate/commit/fa944dc9fe4ec8b45c52eda1ee266cc37b1b9f3b))
- ([#1](https://github.com/Sanofi-Accelerator/Marketing-Suite-US//issues/1)) allow passing a parameter to specify the root folder for scripts - ([494857c](https://github.com/Sanofi-GitHub/snowflake-automate/commit/494857c882dedddcc6bf580e0d1750e1a240cced))
- Detect repeatable scripts - ([c4fb6b6](https://github.com/Sanofi-GitHub/snowflake-automate/commit/c4fb6b6ea28f4ee490c6393d7c1d51952c281975))
- Prepare scripts for repeatable scripts - ([57f67f4](https://github.com/Sanofi-GitHub/snowflake-automate/commit/57f67f4776a1845b0521206db95972257b70f1af))

### 🐛 Bug Fixes

- Correct expansion for paths - ([9b7de9b](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9b7de9b7158f6e2e43ca10d9181d881ebb7c1a6e))
- Better logging of dir name - ([f856ff8](https://github.com/Sanofi-GitHub/snowflake-automate/commit/f856ff8641b604c7d5453a8bf56ea531411c17f1))
- Initiate empty var to solve unbound variable error - ([638999b](https://github.com/Sanofi-GitHub/snowflake-automate/commit/638999b43ff22e07dabb63efe652b0e081cdb111))
- Search for R__ anywhere in file name for repeatable files - ([5783880](https://github.com/Sanofi-GitHub/snowflake-automate/commit/5783880cd17e1746ff596e3dcc1f634803dd20c2))

### ⚙️ Miscellaneous Tasks

- Remove debug log - ([03886a5](https://github.com/Sanofi-GitHub/snowflake-automate/commit/03886a5ac1800df3eb2c1c0ad481979ca0b2cca9))
- Update logging message - ([195f1b4](https://github.com/Sanofi-GitHub/snowflake-automate/commit/195f1b45884e961aea0bc31795ae53a9d1ec9984))
- Apply BP for variable calls - ([9cbd24b](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9cbd24b1e20e227aa096de58491cb40adc95404a))
- Same order for options def & interpretation - ([1cf3d01](https://github.com/Sanofi-GitHub/snowflake-automate/commit/1cf3d018726785bccd481cb8e3ff66527cab4ce9))
- Use namespace in all functions - ([8dfaf61](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8dfaf61aa39f9c96c8b4ef8ac52976cfaa2b1569))
- Simplify function's check - ([b047531](https://github.com/Sanofi-GitHub/snowflake-automate/commit/b047531b1fbe9d75b3857f3763d3672f23b184ec))
- Add namespace like info to helpers functions - ([76d4f3e](https://github.com/Sanofi-GitHub/snowflake-automate/commit/76d4f3ef12e0b85628a2ac8618dea64fbfeefe3b))
- Set replace_placeholder as true helper function - ([883df34](https://github.com/Sanofi-GitHub/snowflake-automate/commit/883df3417723febbc1879109fac8166cb48ac01c))
## [1.0.1](https://github.com/Sanofi-GitHub/snowflake-automate/compare/v1.0.0..v1.0.1) - 2023-05-31

### ⛰️  Features

- Perform substitution in subshell process - ([9316489](https://github.com/Sanofi-GitHub/snowflake-automate/commit/93164899e3626114c5c940db794b7d74886f9fc3))

### 🐛 Bug Fixes

- Enable export of sourced variables - ([01d0edf](https://github.com/Sanofi-GitHub/snowflake-automate/commit/01d0edf27ee08e6d0a23a93b1093101700df7264))
- Change method to replace placeholders - ([3a55612](https://github.com/Sanofi-GitHub/snowflake-automate/commit/3a556127a93674d6759e09010874226f07fe0be3))
## [1.0.0] - 2023-05-31

### ⛰️  Features

- Add major version management - ([479262e](https://github.com/Sanofi-GitHub/snowflake-automate/commit/479262e4550fdfaaa8b2f68f9869f46549e1ddcf))
- Add example workflows - ([8427a5e](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8427a5e2cbfbd723358bdc9ba72928e9a31bc8b9))
- Update README with github workflows - ([a98ed80](https://github.com/Sanofi-GitHub/snowflake-automate/commit/a98ed80b9d043677bc0850c52c8f095207a5a368))
- Create init action - ([b27f4f1](https://github.com/Sanofi-GitHub/snowflake-automate/commit/b27f4f1927aa4083c441cd05656dffa25975ef9a))
- Rework init to store whole current state - ([d3b2c49](https://github.com/Sanofi-GitHub/snowflake-automate/commit/d3b2c49438de7639095f4e2809b4719e73a5114e))
- Store prepared scripts as artifacts - ([4caef7c](https://github.com/Sanofi-GitHub/snowflake-automate/commit/4caef7c768ad5344bad228db4b71b08261b268dc))
- Upload prepared scripts as artifact - ([323b706](https://github.com/Sanofi-GitHub/snowflake-automate/commit/323b7069c361c2c7a651021ac7e17727c69dee39))
- Test for empty env vars - ([8d79d6a](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8d79d6a467fd03cf1e2e9d29585a5f22979bace0))
- Share actions - ([9f24151](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9f24151c9ed2aaeef77a4a20c2b3ff5373af4d97))
- Declare global action - ([99ac296](https://github.com/Sanofi-GitHub/snowflake-automate/commit/99ac2961d47a8d966bfd4c038bc62a704dff95ac))
- Create global workflow - ([a416ece](https://github.com/Sanofi-GitHub/snowflake-automate/commit/a416ece2b38b881084dda230dec58659273ce37c))
- Add warehouse parameter - ([54aa642](https://github.com/Sanofi-GitHub/snowflake-automate/commit/54aa642a07954a89640a4afaaed7a954a49e4198))
- Add role parameter - ([2521a5b](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2521a5b01adfa33f9e525242bf663e7c30caf464))
- Remove default values - ([aedf7dc](https://github.com/Sanofi-GitHub/snowflake-automate/commit/aedf7dc922b189e77dccbbe93dbdd110be31fca2))
- Add snowflake db param - ([994ff10](https://github.com/Sanofi-GitHub/snowflake-automate/commit/994ff10074736be9017ddb8dd87672997086131b))
- Enable preparation - ([ad52c2f](https://github.com/Sanofi-GitHub/snowflake-automate/commit/ad52c2f7c5321fdb555edefc241691b80f0ad179))
- Install dependencies - ([7d463c6](https://github.com/Sanofi-GitHub/snowflake-automate/commit/7d463c60e9f64a4e83cc60eaf04f5a3f6aa53d78))
- Create first version of action - ([ba8f1ac](https://github.com/Sanofi-GitHub/snowflake-automate/commit/ba8f1acf74767b24c3b528820eb336eab84f8c04))
- Use env vars for snowsql connection instead of config file - ([74e476c](https://github.com/Sanofi-GitHub/snowflake-automate/commit/74e476c4b3d683e125a5f2760138de9cc4adb05f))
- Generalize dependency check function - ([429b883](https://github.com/Sanofi-GitHub/snowflake-automate/commit/429b88355bbe1eca7efc48ff0a7de0247bea823f))
- Do not check for existence of deployment file (if nothing to run) - ([80718b2](https://github.com/Sanofi-GitHub/snowflake-automate/commit/80718b26fe6c12d15104db2bf3807850003feaff))
- Remove global file - ([11e6590](https://github.com/Sanofi-GitHub/snowflake-automate/commit/11e659022fc56269252df401379832e3efcf5592))
- Run + store state for  each file separately - ([c23f591](https://github.com/Sanofi-GitHub/snowflake-automate/commit/c23f59140fa55b7bbf17412e1e977ea3ca2ea444))
- Disable logging files - ([1623a58](https://github.com/Sanofi-GitHub/snowflake-automate/commit/1623a584c7e6f1bf1b28741d399b00b2af75faf9))
- Generalize the execute function to run a file - ([69f1d2e](https://github.com/Sanofi-GitHub/snowflake-automate/commit/69f1d2e5420d02aa0c8171e5837f49ab578d6721))
- Allow for status field + stack all deployment statuses with run time - ([2ce5f48](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2ce5f485c7701543f413abeaece8fb324c0cfc4e))
- Add logging for init - ([c1b11db](https://github.com/Sanofi-GitHub/snowflake-automate/commit/c1b11db2a98fa8de09d4a97a633a98b414830f3a))
- Make init a separate action - ([2d4fc83](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2d4fc83e1cb46da2d89ac4197c9e01e357983096))
- Migrate scripts - ([508cd93](https://github.com/Sanofi-GitHub/snowflake-automate/commit/508cd93ceb6f40f61fa8e57cfd0e983827c6ffa0))
- Ignore deployment related files - ([3708243](https://github.com/Sanofi-GitHub/snowflake-automate/commit/37082432bb0ccd3c3b3503d8b9d0e2b0a4ab6749))

### 🐛 Bug Fixes

- Add note on manual env - ([48da4b3](https://github.com/Sanofi-GitHub/snowflake-automate/commit/48da4b338007bffbf602b63dd1e7b01d8c0584e4))
- Default exec requires manual validation - ([0b7dc0c](https://github.com/Sanofi-GitHub/snowflake-automate/commit/0b7dc0c0b4cc310d1564e43788b35c31929a3999))
- Change envs - ([8bc12a9](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8bc12a93f826b13cc0392007ef542bdfcdd0cab9))
- Update - ([8560839](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8560839d743dd4fa4ea23b421ce5d4050f5dd3a4))
- Add node modules - ([de8a205](https://github.com/Sanofi-GitHub/snowflake-automate/commit/de8a205d2c022f83ba759b0e3d745bfbf2026f9f))
- Do not fail if no artifact is found - ([7060e6f](https://github.com/Sanofi-GitHub/snowflake-automate/commit/7060e6f95409e8b222fc218e66523b7ad9ff3033))
- Correct pattern - ([586d77c](https://github.com/Sanofi-GitHub/snowflake-automate/commit/586d77ce78a28a610b93e781f49c3bae670030ff))
- Correct filekey calculation - ([fd3964e](https://github.com/Sanofi-GitHub/snowflake-automate/commit/fd3964e1b6786f0c1afb6d01e2d4ec7028dc22ce))
- Typo - ([28b9f71](https://github.com/Sanofi-GitHub/snowflake-automate/commit/28b9f71a09bec5ee321bda60ac8210ed0f4c4cad))
- Only process actual files - ([bdd2207](https://github.com/Sanofi-GitHub/snowflake-automate/commit/bdd2207806f0f4354caec53775f936beecee99fe))
- More open pattern - ([a60f6d8](https://github.com/Sanofi-GitHub/snowflake-automate/commit/a60f6d8ecc1d98890052cbce5176bcaddcedd938))
- Manage artifact - ([a98a13a](https://github.com/Sanofi-GitHub/snowflake-automate/commit/a98a13aa1987da9f7754c679690922da2b3ec558))
- Change path - ([9227f00](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9227f0080a67c0bac486e7366767ca34b25f53be))
- Indent² - ([3496076](https://github.com/Sanofi-GitHub/snowflake-automate/commit/349607692305181ab521f397daa6397ff13c14ff))
- Change path to script - ([f8d2d85](https://github.com/Sanofi-GitHub/snowflake-automate/commit/f8d2d85fd362645f8358e5c648ba91374c16e024))
- Correct path - ([e34490d](https://github.com/Sanofi-GitHub/snowflake-automate/commit/e34490d3bfd2ecfb872754e8c7f9451318879c47))
- Use local path - ([5c8ee99](https://github.com/Sanofi-GitHub/snowflake-automate/commit/5c8ee9951312122b454a77e4327a3e2ce2ef963d))
- Use parameter path - ([bcd53b0](https://github.com/Sanofi-GitHub/snowflake-automate/commit/bcd53b05830808319724bf5231fbc0592892415e))
- Revert path changes - ([2c50b6f](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2c50b6ffa70c5ccb407eb1589e023c21c1018855))
- Correct gh variable - ([d0bde27](https://github.com/Sanofi-GitHub/snowflake-automate/commit/d0bde275e4089fb152886dc98ce0d5a6d3150162))
- Use global path - ([264d1f4](https://github.com/Sanofi-GitHub/snowflake-automate/commit/264d1f46b8356fbf3c570a2f177499ac78a5646b))
- Use action path - ([f909cf6](https://github.com/Sanofi-GitHub/snowflake-automate/commit/f909cf60614f818b92f52457f496cb513704fea0))
- Remove type - ([d758884](https://github.com/Sanofi-GitHub/snowflake-automate/commit/d75888489ab9ce019f4da50e57dea9754358bb54))
- Correct syntax - ([7bf2f21](https://github.com/Sanofi-GitHub/snowflake-automate/commit/7bf2f2192bda54724e5954545eb406a46c932501))
- Actually use the input params... - ([5d15e19](https://github.com/Sanofi-GitHub/snowflake-automate/commit/5d15e19a2f369c8252656ee643ef225fe3cea954))
- Change snowsql install path - ([f8b72e1](https://github.com/Sanofi-GitHub/snowflake-automate/commit/f8b72e1ec6394d43b6fff404b4dea863d4257bcc))
- Change snowsql install path - ([4650669](https://github.com/Sanofi-GitHub/snowflake-automate/commit/46506691d8f3d6850932eaca235af90e297badb0))
- Add snowsql to bashrc path - ([9c84563](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9c845631ce36ca31b98528d5627d7ace567fadad))
- Add bash reload - ([1e2c5ed](https://github.com/Sanofi-GitHub/snowflake-automate/commit/1e2c5ed4aa9b0df281595ed30ce7f927268d7e6f))
- Correct bash script version - ([3c43793](https://github.com/Sanofi-GitHub/snowflake-automate/commit/3c43793c4f84ed88d5c39b2bb3db5e4e7dc667b3))
- Show whole folder content - ([b4a4be0](https://github.com/Sanofi-GitHub/snowflake-automate/commit/b4a4be055b3f73734d48532cc03a38f641109baf))
- Use local script - ([828f124](https://github.com/Sanofi-GitHub/snowflake-automate/commit/828f12414e6084c5b3d93ccce58b7312039ca637))
- Log files not created anymore - ([40f3b95](https://github.com/Sanofi-GitHub/snowflake-automate/commit/40f3b95b6493dcc637ebf785466accab1e504fb1))
- Logging - ([19e9f79](https://github.com/Sanofi-GitHub/snowflake-automate/commit/19e9f7962277c1a52989d1bd632ff930b17e577d))
- Change logging to avoid duplicates - ([6ed7e32](https://github.com/Sanofi-GitHub/snowflake-automate/commit/6ed7e32d96f1047513972cc188b1fca0136afef9))
- Remove useless array - ([de4b14a](https://github.com/Sanofi-GitHub/snowflake-automate/commit/de4b14ad7cf47125506123cb5cee021381aa32d3))
- Substitution - ([a853483](https://github.com/Sanofi-GitHub/snowflake-automate/commit/a8534832828531dd422866f2f5336dbf0b6deb6d))
- Proper jq syntax - ([4e844e6](https://github.com/Sanofi-GitHub/snowflake-automate/commit/4e844e689feaf14c870614cdf15ca24792a31c04))
- Proper jq syntax - ([f09641e](https://github.com/Sanofi-GitHub/snowflake-automate/commit/f09641e45fb377eb24485ffca8321e79468d39c6))
- Proper jq syntax - ([b558468](https://github.com/Sanofi-GitHub/snowflake-automate/commit/b5584686823fa955d66ff1b4a56e5dcce2bafd91))
- Various - ([844ef1e](https://github.com/Sanofi-GitHub/snowflake-automate/commit/844ef1e488c05d10f21f5435cc807819d48ece27))
- Correct dependencies - ([c305243](https://github.com/Sanofi-GitHub/snowflake-automate/commit/c305243980604e4b9d1dc448342d01dccc3438fb))
- Add run_file setter - ([5b12f68](https://github.com/Sanofi-GitHub/snowflake-automate/commit/5b12f682c09ff987a1b678a9ee6f62aa76ee6871))
- Correct insert query - ([a19ece0](https://github.com/Sanofi-GitHub/snowflake-automate/commit/a19ece015e33ae775f2647909132d033212f76d5))
- Rework README for easier to read options - ([4e7859b](https://github.com/Sanofi-GitHub/snowflake-automate/commit/4e7859b43896f1d5c8121b54790800ae1bbd20a9))
- Search versions from parent folder - ([617e0e1](https://github.com/Sanofi-GitHub/snowflake-automate/commit/617e0e19318abfe67f499db2823d8fd24d76e59c))

### 🧪 Testing

- Add debug log - ([9c0014c](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9c0014cbeeff3693a311664201a0d516fcebde88))
- Add debug log - ([d1502d5](https://github.com/Sanofi-GitHub/snowflake-automate/commit/d1502d5b6a0634b688585129a62a4f09582c2b56))
- Add debug log - ([8ddce43](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8ddce43b00d253ad99171b5b68621eb223f2b526))
- Generate TO_DEPLOY in current dir - ([2ef164f](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2ef164f456adafc25c242524021a7b82f2a750dd))
- Change path var - ([5e05986](https://github.com/Sanofi-GitHub/snowflake-automate/commit/5e059866f77d290355927488c65cbab0ff5f66c3))
- Show output - ([87a2d26](https://github.com/Sanofi-GitHub/snowflake-automate/commit/87a2d26677463af6536973204444a0ef41fddeba))
- Add quotes to have a string - ([8590d62](https://github.com/Sanofi-GitHub/snowflake-automate/commit/8590d623cfc5567fe770be76b88de7794c723ca4))
- Add testing step - ([beb5cd2](https://github.com/Sanofi-GitHub/snowflake-automate/commit/beb5cd291fea1d6b8b02654ef9bf798742c1c2fa))
- Use github action folder - ([007d609](https://github.com/Sanofi-GitHub/snowflake-automate/commit/007d609ab69819fd8f5572cac16f01557e51177f))
- See content of github folder - ([2a3b68d](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2a3b68d486f691dcbcb1b7735ae35931b8f0976e))

### ⚙️ Miscellaneous Tasks

- Remove old version - ([d8c8551](https://github.com/Sanofi-GitHub/snowflake-automate/commit/d8c8551b6ea2fbd28a2040eb1923e1839879049c))
- Rename task - ([ad5e1bb](https://github.com/Sanofi-GitHub/snowflake-automate/commit/ad5e1bb1a3f2c17fcb4a81907ab9de5bb3b3756c))
- Delete unused action - ([9950e3b](https://github.com/Sanofi-GitHub/snowflake-automate/commit/9950e3b9a646fd4974da11cb44edfb270668215c))
- Move shell scripts to dedicated lib folder - ([2d8512f](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2d8512fcaa0fa8d542819b649d5fd8040aae655b))
- Remove test action - ([979d952](https://github.com/Sanofi-GitHub/snowflake-automate/commit/979d952da0ecc1ddf5ae267d0a83c54066955bc1))
- Rename action - ([e94a7ca](https://github.com/Sanofi-GitHub/snowflake-automate/commit/e94a7cac976b61efc91214b6d63562366064117e))
- Remove test step - ([47682ff](https://github.com/Sanofi-GitHub/snowflake-automate/commit/47682ff94f15da12bcaf5c7794917475b3432dab))
- Rename var to match use - ([2000244](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2000244d5c152dc9043fdd538cbb35ef4423d545))
- Simplify functions$ - ([708483a](https://github.com/Sanofi-GitHub/snowflake-automate/commit/708483aa10787510f931bb3042ca572a644f8c41))
- Update readme with usage & submodule info - ([2e8c0f7](https://github.com/Sanofi-GitHub/snowflake-automate/commit/2e8c0f737b858c42f5b82bb05419e865ba50116c))
