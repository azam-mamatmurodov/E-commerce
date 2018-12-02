from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class WithTotalPagesCountPagination(PageNumberPagination):
    page_size_query_param = 'limit'

    def get_paginated_response(self, data):
        return Response({
            'links': {
                'next': self.get_next_link(),
                'previous': self.get_previous_link()
            },
            'count': getattr(self.page.paginator, 'count', 0),
            'total_pages': self.page.paginator.num_pages,
            'results': data
        })