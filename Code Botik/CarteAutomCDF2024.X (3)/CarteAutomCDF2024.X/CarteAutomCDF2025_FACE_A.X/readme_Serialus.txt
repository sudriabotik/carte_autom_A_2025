# README SerialusM2M

Ce document sert de guide exhaustif pour l'utilisation des commandes SerialusM2M :
- **PID** (asservissement vitesse et frein) ? `id0 = '1'`
- **Consignes & Rampe** (réglage des profils de vitesse/accélération) ? `id0 = '2'`
- **Machines à États** (lecture des états) ? `id0 = '3'`

Chaque commande suit le format :
```
<id0><mode><idx_or_inst><field_or_valeur>[<valeur>]\r
```
- `<id0>` : identifiant de la famille de commandes
- `<mode>` :  `'0'` = SET (écriture), `'1'` = GET (lecture)
- `<idx_or_inst>` : indice de paramètre ou instance PID
- `<field_or_valeur>` : paramètre ou valeur (SET)
- `<valeur>` : valeur en ASCII signé (pour SET)

---

## 1. Commandes PID (id0 = '1')
**But** : régler ou lire les gains PID pour l'ascenseur et le frein.

| **Champ** | **Description**           | **Code** | **Inst** | **Field** | **Fonction**                      |
|-----------|---------------------------|----------|----------|-----------|----------------------------------|
| Kp        | Gain proportionnel        | 1000/1100| 0        | 0         | `asc_set_pid` / `asc_get_pid`    |
| Ki        | Gain intégral             | 1001/1101| 0        | 1         |                                  |
| Kd        | Gain dérivé               | 1002/1102| 0        | 2         |                                  |
| IMAX      | Limite intégrale (windup) | 1003/1103| 0        | 3         |                                  |
| --------- | **Frein**                 | 1010/1110| 1        | 0         |                                  |
| Kp_frein  | Gain proportionnel        | 1010/1110| 1        | 0         |                                  |
| Ki_frein  | Gain intégral             | 1011/1111| 1        | 1         |                                  |
| Kd_frein  | Gain dérivé               | 1012/1112| 1        | 2         |                                  |
| IMAX_frein| Limite intégrale          | 1013/1113| 1        | 3         |                                  |
| EINT      | Erreur intégrée (GET)     | 1104     | 0        | 4         | `asc_get_pid`                    |
| EPREV     | Erreur précédente (GET)   | 1105     | 0        | 5         |                                  |
| EINT_frein| Erreur intégrée (GET)     | 1114     | 1        | 4         |                                  |
| EPREV_frn | Erreur précédente (GET)   | 1115     | 1        | 5         |                                  |

**Exemples** :
- SET Kp vitesse à 250 ? `printf("1000 250\r");`
- GET IMAX frein ? `printf("1113\r");`

---

## 2. Commandes Consignes & Rampe (id0 = '2')
**But** : définir ou lire les profils (vitesse max, accélération, etc.).

| **idx** | **Paramètre**            | **SET Code** | **GET Code** | **Fonction**               |
|---------|--------------------------|--------------|--------------|----------------------------|
| 0       | VMAX (ticks)             | 200          | 210          | `asc_set_consigne` / `asc_get_consigne` |
| 1       | ACCEL (ticks)            | 201          | 211          |                            |
| 2       | DECEL (ticks)            | 202          | 212          |                            |
| 3       | HOME_SPEED (ticks)       | 203          | 213          |                            |
| 4       | CLAMP_SPEED (moteur)     | 204          | 214          |                            |
| 5       | CLAMP_BRAKE (frein)      | 205          | 215          |                            |
| 6       | VMIN (ticks)             | 206          | 216          |                            |
| 7       | DIST_VMIN (ticks)        | 207          | 217          |                            |
| 8       | DIST_FINISH (ticks)      | 208          | 218          |                            |

**Exemples** :
- SET accélération à 5000 ? `printf("201 5000\r");`
- GET VMIN ? `printf("216\r");`

---

## 3. Commandes Machines à États (id0 = '3')
**But** : lire l'état courant de l'ascenseur ou du homing.

| **idx** | **État**                 | **Code** | **Fonction**               |
|---------|--------------------------|----------|----------------------------|
| 0       | Ascenseur (ASC_STATE)    | 310      | `ascenseurGetState()`      |
| 1       | Homing (ASC_HOME_STATE)  | 311      | `ascenseurGetHomeState()`  |

**Exemple** :
- GET état homing ? `printf("311\r");`

---

## Implémentation C

```c
/* PID */
static void pid_cmd_serialus(void) { /* ... */ }
void asc_set_pid(uint8_t inst, uint8_t field, double v) { /* ... */ }
double asc_get_pid(uint8_t inst, uint8_t field) { /* ... */ }

/* Consignes */
static void cons_cmd_serialus(void) { /* ... */ }
void asc_set_consigne(uint8_t idx, long v) { /* ... */ }
long asc_get_consigne(uint8_t idx) { /* ... */ }

/* États */
static void state_cmd_serialus(void) { /* ... */ }
```

> Ce README fournit un résumé clair et concis, prêt à être utilisé comme prompt pour intégrer les commandes SerialusM2M dans vos scripts ou applications.

