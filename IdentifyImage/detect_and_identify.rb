require "./detect_face"
require "./identify_face"
detect = Detect.new
identify_faces = ["https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Akshaykumar.jpg/250px-Akshaykumar.jpg", "https://biografieonline.it/img/bio/Bill_Gates_2.jpg"]
face_ids = []
identify_faces.each do |image_url|
  face_id = detect.get_face_id(image_url)
  face_ids << face_id
end
identify = Identify.new
p identify.identify_faces(face_ids)
