
#

La virtualisation est une technologie qui permet de créer plusieurs environnements virtuels sur une seule machine physique. Cette technologie a révolutionné l'informatique moderne en permettant une utilisation plus efficace des ressources matérielles et en offrant une flexibilité accrue pour l'exécution de différents systèmes d'exploitation et applications.


## [01-Cours_Virtulisation_MasterIPS_2022-2023_Seance_01](https://github.com/zelhajou/um5r-master_IPS/blob/main/Virtualization/docs/Cours/01-Cours_Virtulisation_MasterIPS_2022-2023_Seance_01.pdf)


### Historique de la Virtualisation

La virtualisation a débuté dans les années 1960 avec le développement par IBM, en collaboration avec le MIT, du système CP/CMS. Ce système a permis de partitionner les ressources matérielles des mainframes, optimisant leur utilisation. Au fil des décennies, la virtualisation s'est étendue aux serveurs, applications, postes de travail et autres domaines, devenant essentielle dans l'infrastructure informatique moderne.

### Généralités et Concepts Clés

1. **Définition**: La virtualisation est l'abstraction des couches physiques d'un élément de l'infrastructure informatique, permettant à un élément physique d'apparaître comme plusieurs éléments logiques ou vice-versa.
2. Types de Virtualisation:
	- **Virtualisation complète**: Création de machines virtuelles indépendantes.
	- **Paravirtualisation**: Utilisation d'une interface logicielle spécifique.
	- **Virtualisation assistée par le matériel**: Dépend de la technologie du processeur pour améliorer la performance.
	- **Cloisonnement**: Isolation des processus et des ressources.
3. **Hyperviseurs**: Les hyperviseurs sont des plateformes logicielles permettant l'exécution simultanée de plusieurs systèmes d'exploitation sur une même machine physique. Il existe deux types principaux:

	- **Type 1 (bare-metal)**: Exécute directement sur le matériel.
	- **Type 2 (hosted)**: Exécute sur un système d'exploitation hôte.
4. **Systèmes Hôte et Invité**:
	- **Hôte**: Machine physique exécutant l'hyperviseur.
	- **Invité**: Système d'exploitation installé dans une machine virtuelle.

### Pourquoi la Virtualisation?

La virtualisation offre de nombreux avantages, notamment :
- **Optimisation des Ressources**: Amélioration de l'utilisation des ressources matérielles.
- **Agilité et Flexibilité**: Facilite l'adaptation aux changements et l'intégration de nouvelles technologies comme le cloud computing et le Big Data.
- **Réduction des Coûts**: Moins de matériel nécessaire et meilleure gestion de l'énergie.
- **Continuité des Services**: Migration "live" des systèmes invités sans interruption de service.

### Domaines d'Applications

Les principaux domaines d'application de la virtualisation comprennent :

- **Serveurs**: Consolidation des serveurs pour une gestion plus efficace.
- **Postes de Travail**: Virtualisation des environnements de travail pour une meilleure gestion et sécurité.
- **Stockage**: Création de solutions de stockage virtuel pour une gestion plus flexible des données.
- **Réseaux**: Réseaux virtuels pour une meilleure segmentation et sécurité.

### Risques de la Virtualisation

Comme toute technologie, la virtualisation comporte des risques potentiels :

- **Sécurité**: Isolation imparfaite entre les machines virtuelles.
- **Complexité**: Gestion et maintenance des environnements virtuels peuvent être complexes.
- **Performance**: Sur-utilisation des ressources peut entraîner une dégradation des performances.

### VMware vSphere

VMware vSphere est une solution de virtualisation populaire comprenant :

- **ESXi**: Un hyperviseur de type 1 pour l'exécution des machines virtuelles.
- **vCenter Server**: Pour la gestion centralisée des environnements virtuels.
- **vMotion**: Pour la migration live des machines virtuelles.

### Points Très Importants

1. **Abstraction des Ressources**: Comprendre l'importance de l'abstraction dans la virtualisation.
2. **Hyperviseurs**: Différence entre les types 1 et 2 et leur rôle dans la virtualisation.
3. **Avantages et Risques**: Équilibrer les bénéfices de la virtualisation avec ses défis potentiels.
4. **Applications**: Connaître les différents domaines où la virtualisation peut être appliquée.
5. **Technologies Clés**: VMware vSphere et ses composants principaux pour la gestion des environnements virtuels.

En conclusion, la virtualisation transforme la gestion des systèmes informatiques, offrant des solutions flexibles et efficaces pour répondre aux besoins changeants des entreprises modernes.

## [02-Cours virtualisation-MasterIPS-2022-2023-Seance_02](https://github.com/zelhajou/um5r-master_IPS/blob/main/Virtualization/docs/Cours/02-Cours%20virtualisation-MasterIPS-2022-2023-Seance_02.pdf)

### Introduction à la Virtualisation
La virtualisation est un ensemble de techniques matérielles et logicielles qui permettent d’exécuter plusieurs systèmes d’exploitation (OS) et applications sur une seule machine physique. Elle repose sur l’utilisation de machines virtuelles (VM) qui fonctionnent comme des ordinateurs physiques, grâce à un hyperviseur.

**Terminologie**

1. **Hyperviseur (Hypervisor)**: Il en existe deux types :

	- **Bare-metal (Type 1)**: Directement sur le matériel physique.
	- **Hosted (Type 2)**: Sur un OS existant. 
2. **Hôte (Host)**: La machine physique exécutant l’hyperviseur, dotée de multiples processeurs multicœurs, de plusieurs gigaoctets de RAM et de téraoctets d’espace disque, souvent avec un stockage en réseau (NAS ou SAN).
3. **Système Invité (Guest)**: OS installé à l’intérieur d’une machine virtuelle.
4. **Machine Virtuelle (VM)**: Système d’exploitation exécuté à l’aide d’un hyperviseur, avec du matériel partiellement ou totalement émulé.
5. **Migration Live (Vmotion)**: Déplacement d’un invité d’un hôte à un autre sans interruption de service.

**Candidats à la Virtualisation**

Les serveurs de bases de données (Oracle, MySQL), les serveurs d’applications (WebSphere, WebLogic, Tomcat) et les serveurs réseau (DNS, DHCP, NTP) sont souvent virtualisés. Il n’y a pas de restriction quant aux systèmes d’exploitation utilisés (Windows, Linux, Solaris, etc.).



