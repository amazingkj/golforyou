	let sel_file;
 
    $(document).ready(function() {
        $("#imgFile").on("change", handleImgFileSelect);
   			console.log(1);
   
    });
 		
    function handleImgFileSelect(e) {
        let files = e.target.files;
        let filesArr = Array.prototype.slice.call(files);
 
        let reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 		console.log(3);
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            let reader = new FileReader();
            reader.onload = function(e) {
			console.log(reader.onload);
                $("#image_section").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }