# Check-UI CLEAN ROBLOX SKILL — v1.0.0

🎉 **Premier release officiel du Design System & Skill Check-UI pour Roblox Studio.**

Check-UI est le standard absolu pour créer des interfaces cartoon, simulateurs et tycoons propres, modernes, non-génériques et 100% responsives sur Roblox.

---

### 📦 Contenu du Pack & Téléchargement

Téléchargez l'archive complète ci-dessous (`Check-UI-CLEAN-ROBLOX-SKILL-v1.0.0.zip`) ou clonez le dépôt :
- **`SKILL.md`** : Skill AI prêt à l'emploi pour Antigravity, Claude, ChatGPT, Cursor, Copilot.
- **`DESIGN_SYSTEM.md`** : Manuel complet de spécifications mathématiques, palette et typographie.
- **`README.md`** : Guide illustré de démarrage rapide.
- **`src/`** : Modules Luau de production (`CheckUITheme.luau`, `CheckUIComponents.luau`, `CheckUIController.luau`).
- **`examples/`** : Menus complets prêts à importer (`ShopMenuExample.luau`, `HarmonizedMenusExample.luau`).
- **`assets/`** : Renders et panoramas comparatifs haute résolution.

---

### ✨ Piliers Majeurs du Design System

1. **Typographie Stricte `GothamBlack`** :
   - Titres à 38px (stroke noir 3.2px), labels de boutons à 26px (stroke 2.8px), textes de contenu à 18-22px (stroke 2.2px).
2. **Bouton de Fermeture `[X]` 3D Biseauté** :
   - Base bordeaux sombre (`#730010`) de 38x38px créant l'extrusion 3D inférieure.
   - Face supérieure avec dégradé vibrant rouge/rose (`#ff7daf` à `#ff1428`) et trait de séparation `SepLine`.
   - Liseré intérieur pastel (`#ffd2eb`, 1.2px) et micro-interactions centrées (`UIScale`).
3. **Ombre Portée 2-Tier sous les Headers** :
   - Ligne supérieure d'accent sombre thématique (3px) + ligne inférieure noire pure (3px).
4. **Fond Ardoise Opaque (`#3B5866`)** :
   - Fini les fonds semi-transparents ternes. Fond solide avec coins de 4px (`UICorner`) et contour noir profond de 3.5px (`UIStroke`).
5. **Damiers en Dégradé Continu** :
   - Texture pleine hauteur avec dégradé vertical (1 -> 0.82 -> 0.35 -> 0.10) sans aucune coupure horizontale.
6. **Moteur Responsive Universel (`UIScale`)** :
   - Calcul dynamique basé sur `camera.ViewportSize` (baseline `1050 x 620`, borné entre `0.52` sur mobile et `1.18` sur desktop/4K).
7. **Animation Sunburst Continue** :
   - Rotation douce à 20°/s en `RenderStepped`, mise en pause automatique quand le menu est masqué.
