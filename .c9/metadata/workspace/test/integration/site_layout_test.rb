{"filter":false,"title":"site_layout_test.rb","tooltip":"/test/integration/site_layout_test.rb","undoManager":{"mark":0,"position":0,"stack":[[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":0,"column":0},"end":{"row":0,"column":21}},"text":"require 'test_helper'"},{"action":"insertText","range":{"start":{"row":0,"column":21},"end":{"row":1,"column":0}},"text":"\n"},{"action":"insertLines","range":{"start":{"row":1,"column":0},"end":{"row":12,"column":0}},"lines":["","class SiteLayoutTest < ActionDispatch::IntegrationTest","","  test \"layout links\" do","    get root_path","    assert_template 'static_pages/home'","    assert_select \"a[href=?]\", root_path, count: 2","    assert_select \"a[href=?]\", help_path","    assert_select \"a[href=?]\", about_path","    assert_select \"a[href=?]\", contact_path","  end"]},{"action":"insertText","range":{"start":{"row":12,"column":0},"end":{"row":12,"column":3}},"text":"end"}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":12,"column":3},"end":{"row":12,"column":3},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1412812205032,"hash":"221925619d0170f8ace3ec03978446ff795a0c39"}