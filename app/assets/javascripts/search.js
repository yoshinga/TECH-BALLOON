  $(function() {
  var search_list = $(".contents.row");

  function buildHTML(content){
    var html = `
    <div class="content">
      <div class="content__left">
        <div class="content__left--image"></div>
      </div>
      <div class="content__right">
        <div class="content__right__top">
          <a class="content__right__top--title" href="/posts/${content.id}">${content.title}</a>
        </div>
        <div class="content__right__bottom">
          <div class="content__right__bottom--userName">
            <a class="content__right__bottom--userName--btn" href="/users/${content.user}">${content.name}</a>
          </div>
          <div class="content__right__bottom--date">
            ${content.date}
          </div>
        </div>
      </div>
    </div> `;

     search_list.append(html);

  }

  function appendErrMsgToHTML(msg) {
    var html = `<a class="content__right__bottom--userName--btn">${msg}</a>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      search_list.empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          buildHTML(post);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿がありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});