library(shiny)

ui <- tagList(
  tags$head(
    tags$meta(charset = "UTF-8"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1.0"),
    tags$title("CV | Carolien C.H.M. Maas"),
    tags$link(
      href = "https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,700;1,400&family=Source+Sans+3:wght@300;400;500;600;700&display=swap",
      rel = "stylesheet"
    ),
    tags$link(
      href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css",
      rel = "stylesheet"
    ),
    tags$style(HTML("
      * { margin: 0; padding: 0; box-sizing: border-box; }
      html { scroll-behavior: smooth; }

      :root {
        --primary: #8B7355;
        --primary-dark: #5C4A35;
        --primary-light: #C4A97D;
        --primary-lighter: #E8DDD0;
        --accent: #D4A853;
        --bg: #FDFBF7;
        --sidebar-bg: #F7F2EB;
        --text: #2C2C2C;
        --text-light: #5A5A5A;
        --text-muted: #8A8A8A;
        --border: #E8E0D4;
        --shadow: 0 2px 16px rgba(139,115,85,0.08);
        --shadow-hover: 0 4px 24px rgba(139,115,85,0.14);
        --radius: 12px;
        --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      }

      body {
        font-family: 'Source Sans 3', 'Source Sans Pro', -apple-system, sans-serif;
        background: var(--bg);
        color: var(--text);
        line-height: 1.7;
        font-size: 15px;
        -webkit-font-smoothing: antialiased;
        overflow-x: hidden;
      }

      .cv-wrapper {
        max-width: 1140px;
        margin: 0 auto;
        padding: 40px 20px;
      }

      /* ── Header ── */
      .cv-header {
        text-align: center;
        padding: 50px 40px 45px;
        background: linear-gradient(135deg, var(--sidebar-bg) 0%, #FDF9F3 100%);
        border-radius: var(--radius);
        margin-bottom: 30px;
        position: relative;
        overflow: hidden;
        animation: fadeInUp 0.5s ease-out both;
      }
      .cv-header::before {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--primary-light), var(--accent), var(--primary-light));
      }
      .avatar {
        width: 120px; height: 120px;
        border-radius: 50%;
        margin: 0 auto 24px;
        box-shadow: 0 4px 20px rgba(139,115,85,0.25);
        border: 4px solid var(--primary-lighter);
        overflow: hidden;
      }
      .avatar img {
        width: 100%; height: 100%;
        object-fit: cover;
        display: block;
      }
      .cv-header h1 {
        font-family: 'Playfair Display', serif;
        font-size: 2.6rem; font-weight: 700;
        color: var(--primary-dark);
        letter-spacing: 2px; margin-bottom: 16px;
      }
      .cv-header .tagline {
        font-size: 1.05rem; color: var(--text-light);
        max-width: 620px; margin: 0 auto;
        font-weight: 300; line-height: 1.8;
      }
      .header-nav {
        display: flex; justify-content: center;
        gap: 14px; margin-top: 28px; flex-wrap: wrap;
      }
      .header-nav a {
        display: inline-flex; align-items: center; gap: 8px;
        padding: 8px 18px; border-radius: 50px;
        background: white; color: var(--primary);
        text-decoration: none; font-size: 0.88rem; font-weight: 500;
        box-shadow: 0 1px 4px rgba(0,0,0,0.06);
        transition: var(--transition); border: 1px solid transparent;
      }
      .header-nav a:hover {
        border-color: var(--primary-light);
        box-shadow: var(--shadow);
        transform: translateY(-1px);
      }
      .header-nav a i { font-size: 0.9rem; }

      /* ── Two-column layout ── */
      .cv-body {
        display: grid;
        grid-template-columns: 300px 1fr;
        gap: 30px; align-items: start;
      }

      /* ── Sidebar ── */
      .sidebar { position: sticky; top: 20px; }
      .sidebar-card {
        background: white;
        border-radius: var(--radius);
        padding: 28px 24px;
        box-shadow: var(--shadow);
        margin-bottom: 20px;
        border: 1px solid var(--border);
        animation: fadeInUp 0.5s ease-out both;
      }
      .sidebar-card:nth-child(1) { animation-delay: 0.08s; }
      .sidebar-card:nth-child(2) { animation-delay: 0.14s; }
      .sidebar-card:nth-child(3) { animation-delay: 0.20s; }
      .sidebar-card:nth-child(4) { animation-delay: 0.26s; }

      .sidebar-card h2 {
        font-family: 'Playfair Display', serif;
        font-size: 1.2rem; font-weight: 700;
        color: var(--primary-dark);
        margin-bottom: 18px; padding-bottom: 10px;
        border-bottom: 2px solid var(--primary-lighter);
      }

      /* Skill tags */
      .skill-tags { display: flex; flex-wrap: wrap; gap: 8px; }
      .skill-tag {
        display: inline-block;
        padding: 6px 14px;
        background: var(--sidebar-bg);
        border-radius: 50px;
        font-size: 0.85rem; font-weight: 500;
        color: var(--primary-dark);
        border: 1px solid var(--border);
        transition: var(--transition);
      }
      .skill-tag:hover {
        background: var(--primary); color: white;
        border-color: var(--primary);
        transform: translateY(-1px);
      }

      /* Languages */
      .lang-item {
        display: flex; justify-content: space-between; align-items: center;
        padding: 8px 0; border-bottom: 1px solid #f0ebe3;
      }
      .lang-item:last-child { border-bottom: none; }
      .lang-name { font-weight: 500; }
      .lang-level { font-size: 0.85rem; color: var(--text-muted); font-weight: 300; }

      /* Hobbies */
      .hobby-item {
        display: flex; align-items: center;
        gap: 10px; padding: 6px 0;
        font-size: 0.92rem; color: var(--text-light);
      }
      .hobby-item i { color: var(--primary-light); width: 16px; text-align: center; }

      /* Print button */
      .print-btn {
        display: flex; align-items: center; justify-content: center;
        gap: 10px; width: 100%;
        padding: 12px; border: 2px solid var(--primary);
        border-radius: var(--radius); background: transparent;
        color: var(--primary);
        font-family: 'Source Sans 3', sans-serif;
        font-size: 0.92rem; font-weight: 600;
        cursor: pointer; transition: var(--transition);
      }
      .print-btn { text-decoration: none; }
      .print-btn:hover { background: var(--primary); color: white; }

      /* ── Main content ── */
      .main-content section {
        background: white;
        border-radius: var(--radius);
        padding: 32px;
        box-shadow: var(--shadow);
        margin-bottom: 24px;
        border: 1px solid var(--border);
        animation: fadeInUp 0.5s ease-out both;
      }
      .main-content section:nth-of-type(1) { animation-delay: 0.10s; }
      .main-content section:nth-of-type(2) { animation-delay: 0.20s; }
      .main-content section:nth-of-type(3) { animation-delay: 0.30s; }
      .main-content section:nth-of-type(4) { animation-delay: 0.40s; }

      .main-content section h2 {
        font-family: 'Playfair Display', serif;
        font-size: 1.5rem; font-weight: 700;
        color: var(--primary-dark);
        margin-bottom: 28px;
        display: flex; align-items: center; gap: 12px;
      }
      .main-content section h2 i { font-size: 1.1rem; color: var(--primary-light); }

      /* Timeline */
      .timeline { position: relative; padding-left: 28px; }
      .timeline::before {
        content: ''; position: absolute;
        left: 12px; top: 14px; bottom: 0;
        width: 2px;
        background: linear-gradient(to bottom, var(--primary-light), var(--primary-lighter));
        border-radius: 2px;
      }
      .timeline-item { position: relative; padding-bottom: 32px; }
      .timeline-item:last-child { padding-bottom: 0; }
      .timeline-item::before {
        content: ''; position: absolute;
        left: -24px; top: 8px;
        width: 12px; height: 12px;
        border-radius: 50%;
        background: var(--primary);
        border: 3px solid white;
        box-shadow: 0 0 0 2px var(--primary-light);
        z-index: 1;
      }
      .timeline-header {
        display: flex; justify-content: space-between;
        align-items: flex-start; margin-bottom: 6px;
        flex-wrap: wrap; gap: 8px;
      }
      .timeline-title { font-size: 1.12rem; font-weight: 600; color: var(--text); }
      .timeline-date {
        font-size: 0.85rem; color: var(--primary); font-weight: 600;
        background: var(--sidebar-bg);
        padding: 3px 12px; border-radius: 50px; white-space: nowrap;
      }
      .timeline-org { font-size: 0.95rem; color: var(--primary); font-weight: 500; margin-bottom: 8px; }
      .timeline-desc { font-size: 0.92rem; color: var(--text-light); line-height: 1.7; }
      .timeline-thesis {
        display: block; font-style: italic; color: var(--text);
        margin-bottom: 6px; text-decoration: none;
        transition: var(--transition);
      }
      a.timeline-thesis:hover { color: var(--primary); }

      /* Publication cards */
      .pub-card {
        display: block; text-decoration: none; color: inherit;
        padding: 22px;
        background: linear-gradient(135deg, #FDFBF7, white);
        border-radius: 10px; border-left: 4px solid var(--primary);
        margin-bottom: 18px; transition: var(--transition);
        cursor: pointer;
      }
      .pub-card:last-child { margin-bottom: 0; }
      .pub-card:hover { box-shadow: var(--shadow-hover); transform: translateX(3px); }
      .pub-journal {
        display: inline-flex; align-items: center; gap: 8px;
        font-weight: 600; color: var(--primary-dark); font-size: 1rem;
        margin-bottom: 6px;
      }
      .pub-date {
        float: right; font-size: 0.85rem; color: var(--primary); font-weight: 600;
        background: var(--sidebar-bg);
        padding: 2px 10px; border-radius: 50px;
      }
      .pub-title {
        display: block; font-size: 0.92rem; color: var(--text-light);
        line-height: 1.6; margin-top: 4px;
        text-decoration: none; transition: var(--transition);
      }
      .pub-title:hover { color: var(--primary); }
      .pub-authors {
        font-size: 0.82rem; color: var(--text-muted);
        line-height: 1.5; margin-top: 8px;
      }
      .pub-authors strong { color: var(--primary-dark); font-weight: 600; }
      .pub-award {
        display: inline-flex; align-items: center; gap: 6px;
        margin-top: 10px; padding: 5px 12px;
        background: linear-gradient(135deg, #FFF8E7, #FFF3D4);
        border-radius: 50px; font-size: 0.82rem; font-weight: 600; color: #B8860B;
      }

      /* Education grid */
      .edu-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
      .edu-card {
        padding: 22px;
        background: linear-gradient(135deg, #FDFBF7, white);
        border-radius: 10px; border-top: 3px solid var(--primary-light);
        transition: var(--transition);
      }
      .edu-card:hover { box-shadow: var(--shadow-hover); transform: translateY(-2px); }
      .edu-degree {
        font-family: 'Playfair Display', serif;
        font-size: 1.05rem; font-weight: 700;
        color: var(--primary-dark); margin-bottom: 6px; line-height: 1.4;
      }
      .edu-school { font-size: 0.92rem; color: var(--primary); font-weight: 500; margin-bottom: 4px; }
      .edu-year { font-size: 0.85rem; color: var(--text-muted); margin-bottom: 12px; }
      .edu-detail {
        display: flex; align-items: center; gap: 8px;
        font-size: 0.88rem; color: var(--text-light); padding: 3px 0;
      }
      .edu-detail i { color: var(--primary-light); font-size: 0.45rem; width: 12px; }
      .gpa-badge {
        display: inline-flex; align-items: center; gap: 6px;
        padding: 4px 12px; background: var(--sidebar-bg);
        border-radius: 50px; font-size: 0.85rem; font-weight: 600;
        color: var(--primary-dark); margin-top: 8px;
      }

      /* App cards */
      .app-grid { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 16px; }
      .app-card {
        display: block; text-decoration: none; color: inherit;
        padding: 20px;
        background: linear-gradient(135deg, #FDFBF7, white);
        border-radius: 10px; border-top: 3px solid var(--primary-light);
        transition: var(--transition); text-align: center;
      }
      .app-card:hover { box-shadow: var(--shadow-hover); transform: translateY(-2px); }
      .app-card .app-icon {
        font-size: 1.8rem; color: var(--primary-light); margin-bottom: 12px;
      }
      .app-card .app-name {
        font-family: 'Playfair Display', serif;
        font-size: 1rem; font-weight: 700;
        color: var(--primary-dark); margin-bottom: 8px;
      }
      .app-card .app-desc {
        font-size: 0.85rem; color: var(--text-light); line-height: 1.5;
      }
      @media (max-width: 900px) {
        .app-grid { grid-template-columns: 1fr; }
      }

      /* References */
      .ref-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 16px;
      }
      .ref-card {
        padding: 16px; background: var(--sidebar-bg);
        border-radius: 10px; text-align: center;
        transition: var(--transition);
      }
      .ref-card:hover { transform: translateY(-2px); box-shadow: var(--shadow); }
      .ref-name { font-weight: 600; color: var(--text); font-size: 0.92rem; margin-bottom: 4px; }
      .ref-email {
        font-size: 0.8rem; color: var(--primary);
        text-decoration: none; word-break: break-all;
      }
      .ref-email:hover { text-decoration: underline; }

      /* ── Responsive ── */
      @media (max-width: 900px) {
        .cv-body { grid-template-columns: 1fr; }
        .sidebar { position: static; }
        .edu-grid { grid-template-columns: 1fr; }
        .cv-header h1 { font-size: 2rem; letter-spacing: 1px; }
      }
      @media (max-width: 600px) {
        .header-nav { flex-direction: column; align-items: center; }
        .cv-wrapper { padding: 16px 12px; }
        .main-content section { padding: 22px 18px; }
        .ref-grid { grid-template-columns: 1fr; }
      }

      /* ── Print ── */
      @media print {
        body { background: white; font-size: 12px; }
        .cv-wrapper { max-width: 100%; padding: 0; }
        .cv-header { border-radius: 0; }
        .sidebar { position: static; }
        .cv-body { display: block; }
        .sidebar-card, .main-content section {
          box-shadow: none; border: 1px solid #ddd;
          break-inside: avoid;
        }
        .print-btn { display: none; }
        .skill-tag:hover, .pub-card:hover, .edu-card:hover,
        .ref-card:hover, .header-nav a:hover {
          transform: none; box-shadow: none;
        }
      }

      /* ── Animation ── */
      @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(16px); }
        to   { opacity: 1; transform: translateY(0); }
      }
    "))
  ),

  div(class = "cv-wrapper",

    # ── Header ──
    div(class = "cv-header",
      div(class = "avatar", tags$img(src = "img/profile_pic.jpg", alt = "Carolien Maas")),
      tags$h1("CAROLIEN C.H.M. MAAS"),
      p(class = "tagline",
        "Biostatistician with expertise in predictive modeling and causal inference,
         passionate about using programming and statistical modeling to improve
         patient outcomes and make a real-world difference."
      ),
      div(class = "header-nav",
        tags$a(href = "mailto:carolienm@live.nl",
          tags$i(class = "fas fa-envelope"), "Email"),
        tags$a(href = "#", onclick = "navigator.clipboard.writeText('+31 6 1181 9470'); this.textContent='Copied!'; setTimeout(() => { this.innerHTML='<i class=\"fas fa-phone\"></i> +31 6 1181 9470'; }, 1500); return false;",
          tags$i(class = "fas fa-phone"), "+31 6 1181 9470"),
        tags$a(href = "https://github.com/CHMMaas", target = "_blank",
          tags$i(class = "fab fa-github"), "GitHub"),
        tags$a(href = "https://www.linkedin.com/in/carolien-m-82611b13b/", target = "_blank",
          tags$i(class = "fab fa-linkedin"), "LinkedIn"),
        tags$a(href = "https://orcid.org/0000-0002-3867-2465", target = "_blank",
          tags$i(class = "fab fa-orcid"), "ORCID"),
        tags$a(href = "#",
          tags$i(class = "fas fa-location-dot"), "Amsterdam")
      )
    ),

    # ── Body ──
    div(class = "cv-body",

      # ── Sidebar ──
      div(class = "sidebar",

        div(class = "sidebar-card",
          tags$h2("Programming"),
          div(class = "skill-tags",
            span(class = "skill-tag", "R"),
            span(class = "skill-tag", "R Shiny"),
            span(class = "skill-tag", "STATA"),
            span(class = "skill-tag", "Python"),
            span(class = "skill-tag", "SQL"),
            span(class = "skill-tag", "MATLAB")
          )
        ),

        div(class = "sidebar-card",
          tags$h2("Languages"),
          div(class = "lang-item",
            span(class = "lang-name", "Dutch"),
            span(class = "lang-level", "Native")
          ),
          div(class = "lang-item",
            span(class = "lang-name", "English"),
            span(class = "lang-level", "Fluent")
          )
        ),

        div(class = "sidebar-card",
          tags$h2("Hobbies"),
          div(class = "hobby-item",
            tags$i(class = "fas fa-music"), "Afro street style"),
          div(class = "hobby-item",
            tags$i(class = "fas fa-fire"), "Cuban salsa dancing"),
          div(class = "hobby-item",
            tags$i(class = "fas fa-earth-americas"), "Exploring the world")
        ),

        div(class = "sidebar-card",
          tags$a(
            class = "print-btn",
            href = "pdf/Curriculum Vitae Carolien.pdf",
            download = "Curriculum_Vitae_Carolien_Maas.pdf",
            tags$i(class = "fas fa-download"), "Download CV"
          )
        )
      ),

      # ── Main content ──
      div(class = "main-content",

        # Experience
        tags$section(
          tags$h2(tags$i(class = "fas fa-briefcase"), "Experience"),
          div(class = "timeline",

            div(class = "timeline-item",
              div(class = "timeline-header",
                span(class = "timeline-title", "Postdoctoral Researcher"),
                span(class = "timeline-date", "May 2025 – Present")
              ),
              div(class = "timeline-org", "LUMC & Karolinska Institutet"),
              p(class = "timeline-desc",
                "Investigate treatment effect and its heterogeneity across patient
                 populations in nephrology and cardiovascular disease, working within
                 an international network of collaborators."
              )
            ),

            div(class = "timeline-item",
              div(class = "timeline-header",
                span(class = "timeline-title", "PhD"),
                span(class = "timeline-date", "Nov 2020 – Nov 2024")
              ),
              div(class = "timeline-org", "Erasmus MC, IKNL & Tufts MC"),
              tags$a(class = "timeline-thesis",
                href = "https://pure.eur.nl/en/publications/methods-for-prediction-in-cancer-prognosis-and-treatment-effects/",
                target = "_blank",
                'Dissertation: "Methods for Prediction in Cancer: Prognosis and Treatment Effects"'
              ),
              p(class = "timeline-desc",
                "Conducted methodological research on prediction and treatment effect
                 estimation, developed and applied models in cancer prognosis, and
                 actively contributed to the department’s academic and social life."
              )
            ),

            div(class = "timeline-item",
              div(class = "timeline-header",
                span(class = "timeline-title", "Student Tech Assistant"),
                span(class = "timeline-date", "Jul 2017 – Feb 2019")
              ),
              div(class = "timeline-org", "University of Amsterdam"),
              p(class = "timeline-desc",
                "Designed and maintained online assessments, independently improving
                 usability and intuitiveness to enhance the student experience."
              )
            )
          )
        ),

        # Education
        tags$section(
          tags$h2(tags$i(class = "fas fa-graduation-cap"), "Education"),
          div(class = "edu-grid",

            div(class = "edu-card",
              div(class = "edu-degree", "MSc Econometrics"),
              div(class = "edu-school", "Erasmus University Rotterdam"),
              div(class = "edu-year", "2019 – 2020"),
              div(class = "edu-detail",
                tags$i(class = "fas fa-circle"),
                "Business Analytics & Quantitative Marketing"),
              div(class = "gpa-badge",
                tags$i(class = "fas fa-star"), "GPA: 7.9  |  Thesis: 9.0")
            ),

            div(class = "edu-card",
              div(class = "edu-degree", "BSc Econometrics"),
              div(class = "edu-school", "University of Amsterdam"),
              div(class = "edu-year", "2015 – 2019"),
              div(class = "edu-detail",
                tags$i(class = "fas fa-circle"), "Minor: AI & Programming"),
              div(class = "edu-detail",
                tags$i(class = "fas fa-circle"),
                "Exchange at Keio University, Japan"),
              div(class = "edu-detail",
                tags$i(class = "fas fa-circle"), "Aenorm Magazine Committee"),
              div(class = "gpa-badge",
                tags$i(class = "fas fa-star"), "GPA: 8.0  |  Thesis: 8.0")
            )
          )
        ),

        # R Shiny Apps
        tags$section(
          tags$h2(tags$i(class = "fas fa-laptop-code"), "R Shiny Apps"),
          div(class = "app-grid",
            tags$a(class = "app-card",
              href = "https://erasmusmcpublichealth.shinyapps.io/MelanomaWebapp/",
              target = "_blank",
              div(class = "app-icon", tags$i(class = "fas fa-chart-line")),
              div(class = "app-name", "Melanoma Webapp"),
              div(class = "app-desc",
                "Prediction of recurrence-free and melanoma-specific survival after sentinel lymph node biopsy")
            ),
            tags$a(class = "app-card",
              href = "https://mdmerasmusmc.shinyapps.io/LOLECalculator/",
              target = "_blank",
              div(class = "app-icon", tags$i(class = "fas fa-calculator")),
              div(class = "app-name", "LOLE Calculator"),
              div(class = "app-desc",
                "Loss of life expectancy calculator for patients with solid malignancies")
            ),
            tags$a(class = "app-card",
              href = "https://chmapps.shinyapps.io/RID-AKI-90/",
              target = "_blank",
              div(class = "app-icon", tags$i(class = "fas fa-heartbeat")),
              div(class = "app-name", "RID-AKI-90"),
              div(class = "app-desc",
                "Predicted probability of recovery in dialysis-dependent AKI at 90 days")
            )
          )
        ),

        # References
        tags$section(
          tags$h2(tags$i(class = "fas fa-users"), "References"),
          div(class = "ref-grid",
            div(class = "ref-card",
              div(class = "ref-name", "Edouard Fu"),
              tags$a(class = "ref-email",
                href = "mailto:e.l.fu@lumc.nl", "e.l.fu@lumc.nl")
            ),
            div(class = "ref-card",
              div(class = "ref-name", "David van Klaveren"),
              tags$a(class = "ref-email",
                href = "mailto:d.vanklaveren@erasmusmc.nl",
                "d.vanklaveren@erasmusmc.nl")
            ),
            div(class = "ref-card",
              div(class = "ref-name", "Hester Lingsma"),
              tags$a(class = "ref-email",
                href = "mailto:h.lingsma@erasmusmc.nl",
                "h.lingsma@erasmusmc.nl")
            ),
            div(class = "ref-card",
              div(class = "ref-name", "David Kent"),
              tags$a(class = "ref-email",
                href = "mailto:David.Kent@tuftsmedicine.org",
                "David.Kent@tuftsmedicine.org")
            ),
            div(class = "ref-card",
              div(class = "ref-name", "Avinash Dinmohamed"),
              tags$a(class = "ref-email",
                href = "mailto:A.Dinmohamed@iknl.nl",
                "A.Dinmohamed@iknl.nl")
            )
          )
        ),

        # Publications
        tags$section(
          tags$h2(tags$i(class = "fas fa-book-open"), "Publications"),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1111/coa.70039", target = "_blank",
            span(class = "pub-date", "2026"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "Clinical Otolaryngology"),
            p(class = "pub-title",
              "Development and Validation of a Prognostic Model for Persistent Hypoparathyroidism After Total or Completion Thyroidectomy"),
            p(class = "pub-authors", HTML(
              'van Dijk, S. P. J., <strong>Maas, C. C. H. M.</strong>, Alshangi, A., van Driel, M. H. E., Feitsma, E. A., van Kinschot, C. M. J., Lončar, I., van Noord, C., Koppert, L. B., Kruijff, S., van Klaveren, D., Verhoef, C., Peeters, R. P., van Ginhoven, T. M., &amp; Hypoparathyroidism Study Group'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1093/ije/dyaf191", target = "_blank",
            span(class = "pub-date", "2025"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "International Journal of Epidemiology"),
            p(class = "pub-title",
              "Diverging conclusions from risk difference and difference in restricted mean survival time in quantifying absolute treatment effect heterogeneity"),
            p(class = "pub-authors", HTML(
              '<strong>Maas, C. C. H. M.</strong>, Kent, D. M., Dinmohamed, A. G., &amp; van Klaveren, D.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1111/ctr.70299", target = "_blank",
            span(class = "pub-date", "2025"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "Clinical Transplantation"),
            p(class = "pub-title",
              "A Comprehensive Assessment of Plasma CXCL9 and CXCL10 in Improving Clinical Prediction Models for Kidney Allograft Rejection"),
            p(class = "pub-authors", HTML(
              'Souza, A. A., Hesselink, D. A., <strong>Maas, C. C. H. M.</strong>, Stubbs, A. P., Clahsen-van Groningen, M., Baan, C. C., van Klaveren, D., &amp; Boer, K.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1001/jamanetworkopen.2025.22390", target = "_blank",
            span(class = "pub-date", "2025"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "JAMA Network Open"),
            p(class = "pub-title",
              "Predictive Modeling of Heterogeneous Treatment Effects in RCTs: A Scoping Review"),
            p(class = "pub-authors", HTML(
              'Selby, J. V., <strong>Maas, C. C. H. M.</strong>, Fireman, B. H., &amp; Kent, D. M.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1093/bjs/znaf037", target = "_blank",
            span(class = "pub-date", "2025"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "British Journal of Surgery"),
            p(class = "pub-title",
              "External validation of a model to predict recurrence-free and melanoma-specific survival for patients with melanoma after sentinel node biopsy"),
            p(class = "pub-authors", HTML(
              'Stassen, R. C., <strong>Maas, C. C. H. M.</strong>, Leong, S. P., Kashani-Sabet, M., White, R. L., Pockaj, B. A., Zager, J. S., Schneebaum, S., Vetto, J. T., Avisar, E., Harrison Howard, J., O&rsquo;Donoghue, C., Kosiorek, H., van Akkooi, A. C. J., Verhoef, C., van Klaveren, D., Grünhagen, D. J., &amp; Olofsson Bagge, R.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1136/bmjph-2023-000470", target = "_blank",
            span(class = "pub-date", "2024"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "BMJ Public Health"),
            p(class = "pub-title",
              "Disability weights for environmental noise-related health states: results of a disability weights measurement study in Europe"),
            p(class = "pub-authors", HTML(
              'Charalampous, P., <strong>Maas, C. C. H. M.</strong>, &amp; Haagsma, J. A.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1186/s12913-024-11936-7", target = "_blank",
            span(class = "pub-date", "2024"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "BMC Health Services Research"),
            p(class = "pub-title",
              "Identifying persistent high-cost patients in the hospital for care management: development and validation of prediction models"),
            p(class = "pub-authors", HTML(
              'de Ruijter, U. W., Kaplan, Z. L. R., Eijkenaar, F., <strong>Maas, C. C. H. M.</strong>, van der Heide, A., Bax, W. A., &amp; Lingsma, H. F.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1038/s41408-024-01137-0", target = "_blank",
            span(class = "pub-date", "2024"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "Blood Cancer Journal"),
            p(class = "pub-title",
              "Comparative effectiveness of 6x R-CHOP21 versus 6x R-CHOP21 + 2 R for patients with advanced-stage diffuse large B-cell lymphoma"),
            p(class = "pub-authors", HTML(
              '<strong>Maas, C. C. H. M.</strong>, van Klaveren, D., Durmaz, M., Visser, O., Issa, D. E., Posthuma, E. F. M., Zijlstra, J. M., Chamuleau, M. E. D., Lugtenburg, P. J., Kersten, M. J., &amp; Dinmohamed, A. G.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1186/s12874-024-02280-9", target = "_blank",
            span(class = "pub-date", "2024"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "BMC Medical Research Methodology"),
            p(class = "pub-title",
              "Pitfalls of single-study external validation illustrated with a model predicting functional outcome after aneurysmal subarachnoid hemorrhage"),
            p(class = "pub-authors", HTML(
              'de Winkel, J., <strong>Maas, C. C. H. M.</strong>, Roozenbeek, B., van Klaveren, D., &amp; Lingsma, H. F.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1016/S1470-2045(24)00076-7", target = "_blank",
            span(class = "pub-date", "2024"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "The Lancet Oncology"),
            p(class = "pub-title",
              "Development and validation of a novel model to predict recurrence-free survival and melanoma-specific survival after sentinel lymph node biopsy in patients with melanoma: an international, retrospective, multicentre analysis"),
            p(class = "pub-authors", HTML(
              'Stassen, R. C., <strong>Maas, C. C. H. M.</strong>, van der Veldt, A. A. M., Lo, S. N., Saw, R. P. M., Varey, A. H. R., Scolyer, R. A., Long, G. V., Thompson, J. F., Rutkowski, P., Keilholz, U., van Akkooi, A. C. J., Verhoef, C., van Klaveren, D., &amp; Grünhagen, D. J.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1016/j.ebiom.2024.105072", target = "_blank",
            span(class = "pub-date", "2024"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "EBioMedicine"),
            p(class = "pub-title",
              "Dynamics and prognostic value of serum neurofilament light chain in Guillain–Barré syndrome"),
            p(class = "pub-authors", HTML(
              'van Tilburg, S. J., Teunissen, C. E., <strong>Maas, C. C. H. M.</strong>, Thomma, R. C. M., Walgaard, C., Heijst, H., Huizinga, R., van Doorn, P. A., &amp; Jacobs, B. C.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1002/sim.9719", target = "_blank",
            span(class = "pub-date", "2023"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "Statistics in Medicine"),
            p(class = "pub-title",
              "Measuring the performance of prediction models to personalize treatment choice: Defining observed and predicted pairwise treatment effects"),
            p(class = "pub-authors", HTML(
              'van Klaveren, D., <strong>Maas, C. C. H. M.</strong>, &amp; Kent, D. M.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1186/s12874-023-01974-w", target = "_blank",
            span(class = "pub-date", "2023"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "BMC Medical Research Methodology"),
            p(class = "pub-title",
              "Performance metrics for models designed to predict treatment effect"),
            p(class = "pub-authors", HTML(
              '<strong>Maas, C. C. H. M.</strong>, Kent, D. M., Hughes, M. C., Dekker, R., Lingsma, H. F., &amp; van Klaveren, D.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1016/j.eclinm.2023.101994", target = "_blank",
            span(class = "pub-date", "2023"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "eClinicalMedicine (Part of The Lancet Discovery Science)"),
            p(class = "pub-title",
              "Number of life-years lost at the time of diagnosis and several years post-diagnosis in patients with solid malignancies: a population-based study in the Netherlands, 1989–2019"),
            p(class = "pub-authors", HTML(
              '<strong>Maas, C. C. H. M.</strong>, van Klaveren, D., Visser, O., Merkx, M. A. W., Lingsma, H. F., Lemmens, V. E. P. P., &amp; Dinmohamed, A. G.')),
            div(class = "pub-award",
              tags$i(class = "fas fa-trophy"),
              "Best Junior Publication Prize – Public Health 2023")
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1038/s41408-022-00669-7", target = "_blank",
            span(class = "pub-date", "2022"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "Blood Cancer Journal"),
            p(class = "pub-title",
              "Long-term trends in the loss in expectation of life after a diagnosis of chronic lymphocytic leukemia: a population-based study in the Netherlands, 1989–2018"),
            p(class = "pub-authors", HTML(
              'van der Straten, L., <strong>Maas, C. C. H. M.</strong>, Levin, M. D., Visser, O., Posthuma, E. F. M., Doorduijn, J. K., Langerak, A. W., Kater, A. P., &amp; Dinmohamed, A. G.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1038/s41375-022-01535-y", target = "_blank",
            span(class = "pub-date", "2022"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "Leukemia"),
            p(class = "pub-title",
              "Causes of death of patients with follicular lymphoma in the Netherlands by stage and age groups: a population-based study in the pre- and post-rituximab era"),
            p(class = "pub-authors", HTML(
              'Dinnessen, M. A. W., <strong>Maas, C. C. H. M.</strong>, Tonino, S. H., Visser, O., Posthuma, E. F. M., Blijlevens, N. M. A., Kersten, M. J., Lugtenburg, P. J., &amp; Dinmohamed, A. G.'))
          ),

          tags$a(class = "pub-card",
            href = "https://doi.org/10.1111/bjh.17989", target = "_blank",
            span(class = "pub-date", "2022"),
            div(class = "pub-journal",
              tags$i(class = "fas fa-bookmark"), "British Journal of Haematology"),
            p(class = "pub-title",
              "The evolution of the loss of life expectancy in patients with chronic myeloid leukaemia: a population-based study in the Netherlands, 1989–2018"),
            p(class = "pub-authors", HTML(
              '<strong>Maas, C. C. H. M.</strong>, van Klaveren, D., Ector, G. I. C. G., Posthuma, E. F. M., Visser, O., Westerweel, P. E., Janssen, J. J. W. M., Blijlevens, N. M. A., &amp; Dinmohamed, A. G.'))
          )
        )
      )
    )
  )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)
