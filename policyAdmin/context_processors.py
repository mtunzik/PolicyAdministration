def breadcrumbs(request):
    breadcrumbs = get_breadcrumbs(request.path)
    return {'breadcrumbs': breadcrumbs}



def get_breadcrumbs(path):
    breadcrumbs = []
    parts = path.strip('/').split('/')
    for i, part in enumerate(parts):
        url = '/'.join(parts[:i+1])
        breadcrumbs.append({
            'title': part.replace('-', ' ').title(),
            'url': '/' + url,
            'active': i == len(parts) - 1
        })
    return breadcrumbs
