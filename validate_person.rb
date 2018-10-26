require './verify_person'
require './detect_person'
detect_person = DetectPerson.new(["https://dqbasmyouzti2.cloudfront.net/assets/content/cache/made/content/images/articles/Bill_Gates_721_420_80_s_c1.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Bill_Gates_2018.jpg/478px-Bill_Gates_2018.jpg"])
face_ids = detect_person.get_face_ids

verify_person = VerifyPerson.new
puts verify_person.check_identical(face_ids)