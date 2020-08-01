column = ["Activity","Issue", "detial", "CVSS"]
dic_result = {"Activity":"main","Issue": "No problem", "detial": "start.act(main)", "CVSS":"0"}

row_template = """
    <tr>\n
        <th scope="row">[INDEX]</th>\n
        <td>[ACTIVITY]</td>\n
        <td>[ISSUE]</td>\n
        <td>[DETIAL]</td>\n
        <td>[CVSS]</td>\n
    </tr>\n"""


results = []
for i in range(1):
    results.append(dic_result)

html_result = ""
for i in range(len(results)):
    tmp_result = row_template
    tmp_result = tmp_result.replace("[INDEX]", str(i))
    for col in column:
        tmp_result = tmp_result.replace("[" + col.upper() + "]", results[i][col])
    html_result += tmp_result
print(html_result)

with open("report_template.html", "r") as f:
    tmp_html = f.read()
tmp_html = tmp_html.replace("[ALL_RESULT]", html_result)
with open("report.html", "w") as f:
    f.write(tmp_html)
