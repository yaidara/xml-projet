<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <html lang="fr">
            <head>
                <meta charset="UTF-8"/>
                <title>Gestion Académique - UNCHK</title>
                <style>
                    * {
                        box-sizing: border-box;
                    }

                    body {
                        margin: 0;
                        font-family: "Segoe UI", Arial, sans-serif;
                        background: #f6f8fb;
                        color: #1f2937;
                    }

                    .container {
                        width: 92%;
                        max-width: 1200px;
                        margin: 40px auto;
                    }

                    .header {
                        background: #ffffff;
                        border: 1px solid #e5e7eb;
                        border-radius: 18px;
                        padding: 28px;
                        margin-bottom: 24px;
                        box-shadow: 0 8px 24px rgba(15, 23, 42, 0.05);
                    }

                    .header h1 {
                        margin: 0 0 8px 0;
                        font-size: 30px;
                        color: #0f172a;
                    }

                    .header p {
                        margin: 0;
                        color: #64748b;
                        font-size: 15px;
                    }

                    .section {
                        background: #ffffff;
                        border: 1px solid #e5e7eb;
                        border-radius: 18px;
                        padding: 22px;
                        margin-bottom: 24px;
                        box-shadow: 0 8px 24px rgba(15, 23, 42, 0.05);
                    }

                    .section h2 {
                        margin: 0 0 18px 0;
                        font-size: 22px;
                        color: #111827;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        overflow: hidden;
                        border-radius: 12px;
                    }

                    th {
                        background: #0f172a;
                        color: #ffffff;
                        text-align: left;
                        padding: 14px;
                        font-size: 14px;
                    }

                    td {
                        padding: 14px;
                        border-bottom: 1px solid #eef2f7;
                        font-size: 14px;
                    }

                    tr:last-child td {
                        border-bottom: none;
                    }

                    tr:nth-child(even) {
                        background: #fafbfc;
                    }

                    .badge {
                        display: inline-block;
                        padding: 6px 10px;
                        border-radius: 999px;
                        font-size: 12px;
                        font-weight: 600;
                    }

                    .info {
                        background: #e0f2fe;
                        color: #0369a1;
                    }

                    .success {
                        background: #dcfce7;
                        color: #166534;
                    }

                    .warning {
                        background: #fef3c7;
                        color: #92400e;
                    }

                    .danger {
                        background: #fee2e2;
                        color: #991b1b;
                    }

                    .muted {
                        color: #64748b;
                    }

                    .grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                        gap: 16px;
                        margin-top: 18px;
                    }

                    .card {
                        background: #f8fafc;
                        border: 1px solid #e2e8f0;
                        border-radius: 14px;
                        padding: 16px;
                    }

                    .card .label {
                        font-size: 12px;
                        color: #64748b;
                        margin-bottom: 6px;
                    }

                    .card .value {
                        font-size: 20px;
                        font-weight: 700;
                        color: #0f172a;
                    }
                </style>
            </head>

            <body>
                <div class="container">

                    <div class="header">
                        <h1>Système de Gestion Académique</h1>
                        <p>Université : <xsl:value-of select="/universite/@nom"/></p>

                        <div class="grid">
                            <div class="card">
                                <div class="label">Nombre d'étudiants</div>
                                <div class="value">
                                    <xsl:value-of select="count(/universite/etudiants/etudiant)"/>
                                </div>
                            </div>

                            <div class="card">
                                <div class="label">Nombre d'enseignants</div>
                                <div class="value">
                                    <xsl:value-of select="count(/universite/enseignants/enseignant)"/>
                                </div>
                            </div>

                            <div class="card">
                                <div class="label">Nombre de cours</div>
                                <div class="value">
                                    <xsl:value-of select="count(/universite/cours/cour)"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="section">
                        <h2>Étudiants et inscriptions</h2>
                        <table>
                            <tr>
                                <th>ID</th>
                                <th>Nom complet</th>
                                <th>Date de naissance</th>
                                <th>Programme</th>
                                <th>Cours</th>
                                <th>Année académique</th>
                                <th>Note</th>
                                <th>Mention</th>
                            </tr>

                            <xsl:for-each select="/universite/etudiants/etudiant">
                                <xsl:sort select="nom" order="ascending"/>

                                <xsl:for-each select="inscriptions/inscription">
                                    <tr>
                                        <td><xsl:value-of select="../../@id"/></td>
                                        <td>
                                            <xsl:value-of select="../../prenom"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="../../nom"/>
                                        </td>
                                        <td><xsl:value-of select="../../dateNaissance"/></td>
                                        <td>
                                            <span class="badge info">
                                                <xsl:value-of select="../../programme"/>
                                            </span>
                                        </td>
                                        <td><xsl:value-of select="@courRef"/></td>
                                        <td><xsl:value-of select="anneeAcademique"/></td>
                                        <td><xsl:value-of select="note"/></td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="note &gt;= 16">
                                                    <span class="badge success">Très Bien</span>
                                                </xsl:when>
                                                <xsl:when test="note &gt;= 14">
                                                    <span class="badge success">Bien</span>
                                                </xsl:when>
                                                <xsl:when test="note &gt;= 10">
                                                    <span class="badge warning">Passable</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="badge danger">Échec</span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>
                        </table>
                    </div>

                    <div class="section">
                        <h2>Cours</h2>
                        <table>
                            <tr>
                                <th>Code</th>
                                <th>Intitulé</th>
                                <th>Crédits</th>
                                <th>Enseignant responsable</th>
                            </tr>

                            <xsl:for-each select="/universite/cours/cour">
                                <tr>
                                    <td><xsl:value-of select="@code"/></td>
                                    <td><xsl:value-of select="intitule"/></td>
                                    <td><xsl:value-of select="credits"/></td>
                                    <td>
                                        <xsl:variable name="idEns" select="enseignantResponsable/@ref"/>
                                        <xsl:value-of select="/universite/enseignants/enseignant[@id=$idEns]/prenom"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="/universite/enseignants/enseignant[@id=$idEns]/nom"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>

                    <div class="section">
                        <h2>Enseignants</h2>
                        <table>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Département</th>
                            </tr>

                            <xsl:for-each select="/universite/enseignants/enseignant">
                                <tr>
                                    <td><xsl:value-of select="@id"/></td>
                                    <td><xsl:value-of select="nom"/></td>
                                    <td><xsl:value-of select="prenom"/></td>
                                    <td><span class="muted"><xsl:value-of select="departement"/></span></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>

                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>