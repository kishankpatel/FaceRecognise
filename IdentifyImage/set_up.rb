require "./create_person_group"
require "./create_person_group_person"
require "./add_face_to_person_group_person"
require "./train_person_group"
person_group = PersonGroup.new("person-group-id-1")
person_group_id = person_group.create

training_data = {
  "akshya" => [
    "https://www.dailypioneer.com/uploads/2018/story/images/big/we-need-to-put-more-emphasis-on-sports--akshay-kumar-2018-10-26.jpg",
    "https://static.hindi.firstpost.com/static-hindi-firstpost/uploads/886x498/jpg/2018/10/taapsee-pannu-and-sonakshi-sinha-joins-the-starcast-of-akshay-kumar-mangalyaan.jpg"
  ],
  "bill gates" => [
    "https://biografieonline.it/img/bio/Bill_Gates_2.jpg",
    "https://image-us.24h.com.vn/upload/1-2018/images/2018-01-13/1515839555-53-ly-do-don-gian-khien-bill-gates-khong-con-la-nguoi-giau-nhat-the-gioi-anh-1-1515839425-width600height400.jpg",
    "https://cdn.geekwire.com/wp-content/uploads/2016/06/billgates.jpg"
  ],
  "sachin tendulkar" => [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Sachin_Tendulkar_at_MRF_Promotion_Event.jpg/260px-Sachin_Tendulkar_at_MRF_Promotion_Event.jpg",
    "http://im.rediff.com/news/2010/mar/15sachin.jpg",
    "https://i.cricketcb.com/stats/img/faceImages/25.jpg"
  ],
  "saina nehwal" => [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Saina_Nehwal_in_2011.jpg/220px-Saina_Nehwal_in_2011.jpg",
    "http://www.ohmyindia.com/wp-content/uploads/2018/03/image-1-19.jpg",
    "https://images.mid-day.com/images/2018/mar/Saina-CWG.jpg"
  ]

}
person_group_persons_hash = Hash.new
training_data.keys.each do |person_name|
   person_group_person = PersonGroupPerson.new
   person_group_person_id = person_group_person.create(person_group_id, person_name)
   person_group_persons_hash[person_name] = person_group_person_id
end
p "==============>>>person_group_persons_hash"
p person_group_persons_hash

person_group_persons_hash.each do |name,personId|
  new_face = AddFace.new(person_group_id, personId)
  image_urls = training_data[name]
  p new_face.create(image_urls)
end

train_person_group = TrainPersonGroup.new
train_person_group.train(person_group_id)