# MobSF == 3.1.0

from mobsf import MobSF
import javalang

HOST = 'localhost'
PORT = 8000
UPLOAD_APK = '../diva-beta.apk'

def isActivity(class_node):
    if class_node.extends.name == 'AppCompatActivity':
        return True
    else:
        return False


def getClass(tree, target_lines):
    result = set()
    for line in map(int, target_lines.split(',')):
        prev_class = None
        for path, node in tree.filter(javalang.tree.ClassDeclaration):
            if node.position.line > line:
                break
            prev_class = node
        if prev_class is not None and isActivity(prev_class):
            result.add(prev_class.name)
    return result


mobsf = MobSF(HOST, PORT)
apk_file = mobsf.upload(UPLOAD_APK)
report = mobsf.scan(apk_file)

code_analysis = report['code_analysis']
for issue_type in code_analysis.keys():
    files = code_analysis[issue_type]['files']
    for file_path in files.keys():
        src = mobsf.viewSource(apk_file['hash'], file_path)['dat']
        tree = javalang.parse.parse(src)
        target_lines = files[file_path]
        print("file: {}".format(file_path))
        print("line: {}".format(target_lines))
        print("class: {}".format(getClass(tree, target_lines)))