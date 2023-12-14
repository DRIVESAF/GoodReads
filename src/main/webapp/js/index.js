//好书推荐，课程切换
{
    // 获取所有的 a 标签（tab 栏）
    const tabs = document.querySelectorAll('.recommend-classify a');
    // 获取到所有的推荐列表
    const uls = document.querySelectorAll('.recommend-list ul');

    for (let i = 0; i < tabs.length; i++) {
        // 循环为所有的a绑定点击事件
        tabs[i].onclick = function () {
            // 清除所有的a和ul的样式
            for (let j = 0; j < tabs.length; j++) {
                tabs[j].className = '';
                uls[j].className = '';
            }
            // 给当前选中的a和ul添加样式{
            tabs[i].className = 'active';
            uls[i].className = 'current';
        }
    }
}